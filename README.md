# zoneminder-tenvis-jpt3815w
Module PTZ ZoneMinder pour caméra Tenvis JPT3815W (chipset Hi351)

# ZoneMinder PTZ Control – Tenvis JPT3815W (Hi3510)

PTZ control module for **Tenvis JPT3815W** IP camera in **ZoneMinder**.  
Based on the native CGI interface of Hi3510 chipset.

## Features

- Continuous Pan / Tilt  
- Proper STOP on button release  
- Compatible with ZoneMinder Control interface  
- Basic Authentication support  
- Tested on ZoneMinder 1.36+

## Supported commands

| Action | CGI command |
|------|-------------|
| Up | act=up |
| Down | act=down |
| Left | act=left |
| Right | act=right |
| Stop | act=stop |

## ZoneMinder Configuration

### Control Capability

Enable:

- Can Move ✓  
- Can Move Continuous ✓  
- Can Pan ✓  
- Can Tilt ✓

### Monitor → Control

- Control Type: **TenvisJPT3815W**  
- Control Address: **CAMERA_IP_ONLY**

> Do NOT put http:// in Control Address.

## Authentication

Camera requires HTTP Basic Authentication.  
Encode your credentials:

echo -n "user:password" | base64


and put the result in the module header.

## Compatibility

This module works with cameras using:


and put the result in the module header.

## Compatibility

This module works with cameras using:

/web/cgi-bin/hi3510/ptzctrl.cgi



including many Tenvis / generic Hi3510 models.

## License

MIT – Free to use and modify.


