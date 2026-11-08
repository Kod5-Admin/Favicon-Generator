# Favicon Generator

Generate every common favicon and Apple touch icon size from a single PNG, on Windows, with one drag & drop.

Drop `favicon-512x512.png` onto `generate-favicons.vbs` and you get:

| File | Size |
|---|---|
| favicon-16x16.png | 16×16 |
| favicon-32x32.png | 32×32 |
| favicon-48x48.png | 48×48 |
| favicon-96x96.png | 96×96 |
| favicon-192x192.png | 192×192 |
| apple-touch-ipad.png | 76×76 |
| apple-touch-iphone4.png | 114×114 |
| apple-touch-iphone.png | 120×120 |
| apple-touch-ipad-retina.png | 152×152 |

The files are written to the same folder as the source image.

## Requirements

- Windows
- [IrfanView](https://www.irfanview.com) (free). The 64-bit and 32-bit versions are detected automatically.

## Usage

1. Make a square PNG, ideally 512×512.
2. Drag it onto `generate-favicons.vbs`, confirm, and you're done.

Or put `favicon-512x512.png` next to the script and double-click the script.

## HTML snippet

```html
<link rel="icon" type="image/png" sizes="16x16" href="/img/favicon-16x16.png">
<link rel="icon" type="image/png" sizes="32x32" href="/img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="/img/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="192x192" href="/img/favicon-192x192.png">
<link rel="apple-touch-icon" sizes="76x76" href="/img/apple-touch-ipad.png">
<link rel="apple-touch-icon" sizes="120x120" href="/img/apple-touch-iphone.png">
<link rel="apple-touch-icon" sizes="152x152" href="/img/apple-touch-ipad-retina.png">
```

## License

MIT
