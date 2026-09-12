const fs=require('fs'),path=require('path'),http=require('http');
const {chromium}=require('playwright'),sharp=require('sharp');
const root=path.resolve(__dirname,'..');
const palette=JSON.parse(fs.readFileSync(path.join(__dirname,'preview-palette.json')));
const lum=c=>c.map(v=>{v/=255;return v<=.04045?v/12.92:((v+.055)/1.055)**2.4}).reduce((s,v,i)=>s+v*[.2126,.7152,.0722][i],0);
const ratio=(a,b)=>(Math.max(a,b)+.05)/(Math.min(a,b)+.05);
(async()=>{const server=http.createServer((req,res)=>{const f=path.join(root,decodeURIComponent(req.url));res.setHeader('Content-Type',f.endsWith('.html')?'text/html':f.endsWith('.json')?'application/json':f.endsWith('.png')?'image/png':'text/xml');fs.readFile(f,(e,b)=>{res.statusCode=e?404:200;res.end(e?'':b)})});await new Promise(r=>server.listen(0,'127.0.0.1',r));
const browser=await chromium.launch({executablePath:'C:/Program Files/Google/Chrome/Application/chrome.exe',headless:true});
try{const page=await browser.newPage({viewport:{width:896,height:504},deviceScaleFactor:1});await page.goto(`http://127.0.0.1:${server.address().port}/Art/preview.html`);await page.evaluate(()=>window.ready);
const cdp=await page.context().newCDPSession(page);await cdp.send('DOM.enable');await cdp.send('CSS.enable');const {root:doc}=await cdp.send('DOM.getDocument');const fonts={};for(const sel of ['h1','.suffix','.tag','p','.version']){const {nodeId}=await cdp.send('DOM.querySelector',{nodeId:doc.nodeId,selector:sel});fonts[sel]=(await cdp.send('CSS.getPlatformFontsForNode',{nodeId})).fonts;}
const boxes=await page.evaluate(()=>{const out=[];for(const sel of ['h1','.suffix','.tag','p']){const el=document.querySelector(sel);for(const node of el.childNodes){if(node.nodeType!==3||!node.textContent.trim())continue;const r=document.createRange();r.selectNodeContents(node);for(const b of r.getClientRects())out.push({sel,x:b.x,y:b.y,w:b.width,h:b.height,color:getComputedStyle(el).color});}}return out});
fs.mkdirSync(path.join(__dirname,'qa'),{recursive:true});await page.screenshot({path:path.join(root,'Mod/About/Preview.png')});await sharp(path.join(root,'Mod/About/Preview.png')).resize(268).png().toFile(path.join(__dirname,'qa/Preview-268.png'));
await page.addStyleTag({content:'.text{visibility:hidden}.version{visibility:hidden}'});await page.screenshot({path:path.join(__dirname,'qa/Preview-background.png')});
const {data,info}=await sharp(path.join(__dirname,'qa/Preview-background.png')).removeAlpha().raw().toBuffer({resolveWithObject:true});
const checks=boxes.map(b=>{const ink=lum(b.color.match(/\d+/g).slice(0,3).map(Number));let min=100;for(let y=Math.max(0,Math.floor(b.y));y<Math.min(504,Math.ceil(b.y+b.h));y++)for(let x=Math.max(0,Math.floor(b.x));x<Math.min(896,Math.ceil(b.x+b.w));x++){const i=(y*info.width+x)*3;min=Math.min(min,ratio(ink,lum([...data.subarray(i,i+3)])));}return {...b,minContrast:min};});
const hex=s=>s.match(/[a-f\d]{2}/gi).map(x=>parseInt(x,16));const badgeContrast=ratio(lum(hex(palette.accent)),lum(hex(palette.badgeInk)));
const report={fonts,checks,badgeContrast,dimensions:[896,504],bytes:fs.statSync(path.join(root,'Mod/About/Preview.png')).size};fs.writeFileSync(path.join(__dirname,'qa/preview-checks.json'),JSON.stringify(report,null,2));console.log(JSON.stringify(report,null,2));if(checks.some(c=>c.minContrast<4.5)||badgeContrast<4.5)throw Error('Contrast below 4.5');
}finally{await browser.close();server.close();}})().catch(e=>{console.error(e);process.exitCode=1});
