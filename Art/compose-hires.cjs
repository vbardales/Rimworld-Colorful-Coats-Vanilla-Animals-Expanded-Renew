const sharp = require('sharp');
const fs = require('fs');

async function main() {
  const cutoutPath = 'Art/ModIcon-hires-cutout.png';
  const previewPath = 'Art/preview-base-tmp.png';

  // Rotate at full resolution first, trim, THEN downscale for crisp anti-aliasing.
  const rotatedHi = await sharp(cutoutPath)
    .rotate(15, { background: { r: 0, g: 0, b: 0, alpha: 0 } })
    .png()
    .toBuffer();
  const rotTrimmedHi = await sharp(rotatedHi).trim({ threshold: 5 }).toBuffer();
  const rhMeta = await sharp(rotTrimmedHi).metadata();
  console.log('rotated hi-res trimmed', rhMeta.width, rhMeta.height);

  const targetW = 210;
  const targetH = Math.round(rhMeta.height * targetW / rhMeta.width);
  const rotated = await sharp(rotTrimmedHi)
    .resize(targetW, targetH, { kernel: 'lanczos3' })
    .png()
    .toBuffer();
  fs.writeFileSync('Art/ModIcon-corner.png', rotated);
  console.log('downscaled', targetW, targetH);

  const bleedLeft = Math.round(targetW * 0.18);
  const bleedBottom = Math.round(targetH * 0.18);
  const visibleW = targetW - bleedLeft;
  const visibleH = targetH - bleedBottom;

  const visible = await sharp(rotated)
    .extract({ left: bleedLeft, top: 0, width: visibleW, height: visibleH })
    .png()
    .toBuffer();

  const previewMeta = await sharp(previewPath).metadata();
  const left = 0;
  const top = previewMeta.height - visibleH;

  await sharp(previewPath)
    .composite([{ input: visible, left, top }])
    .png()
    .toFile('Mod/About/Preview.png.new');
  console.log('placed', left, top, 'visible', visibleW, visibleH, 'bleed L/B', bleedLeft, bleedBottom);
}
main().catch(e => { console.error(e); process.exit(1); });
