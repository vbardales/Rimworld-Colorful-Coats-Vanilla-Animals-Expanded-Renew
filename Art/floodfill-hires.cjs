const sharp = require('sharp');
const fs = require('fs');

async function main() {
  const iconPath = 'Art/ModIcon-source-v2.png';
  const { data, info } = await sharp(iconPath).ensureAlpha().raw().toBuffer({ resolveWithObject: true });
  const w = info.width, h = info.height, ch = info.channels;
  const bg = [8, 3, 1];
  const tol = 26;

  function isBgLike(x, y) {
    const i = (y * w + x) * ch;
    const dr = data[i] - bg[0], dg = data[i + 1] - bg[1], db = data[i + 2] - bg[2];
    return Math.sqrt(dr * dr + dg * dg + db * db) <= tol;
  }

  const visited = new Uint8Array(w * h);
  const queue = new Int32Array(w * h);
  let qlen = 0;
  function pushIfBg(x, y) {
    if (x < 0 || x >= w || y < 0 || y >= h) return;
    const idx = y * w + x;
    if (visited[idx]) return;
    if (!isBgLike(x, y)) return;
    visited[idx] = 1;
    queue[qlen++] = idx;
  }
  for (let x = 0; x < w; x++) { pushIfBg(x, 0); pushIfBg(x, h - 1); }
  for (let y = 0; y < h; y++) { pushIfBg(0, y); pushIfBg(w - 1, y); }

  let head = 0;
  while (head < qlen) {
    const idx = queue[head++];
    const x = idx % w, y = (idx / w) | 0;
    pushIfBg(x + 1, y); pushIfBg(x - 1, y); pushIfBg(x, y + 1); pushIfBg(x, y - 1);
  }

  let floodCount = 0;
  for (let idx = 0; idx < w * h; idx++) {
    if (visited[idx]) { data[idx * ch + 3] = 0; floodCount++; }
  }
  console.log('flooded', floodCount, 'of', w * h, `(${(100*floodCount/(w*h)).toFixed(1)}%)`);

  const buf = await sharp(data, { raw: { width: w, height: h, channels: ch } }).png().toBuffer();
  const trimmed = await sharp(buf).trim({ threshold: 5 }).toBuffer();
  fs.writeFileSync('Art/ModIcon-hires-cutout.png', trimmed);
  const tm = await sharp(trimmed).metadata();
  console.log('trimmed', tm.width, tm.height);
}
main().catch(e => { console.error(e); process.exit(1); });
