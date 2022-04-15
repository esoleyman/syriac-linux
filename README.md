# Syriac-Linux

ܒܫܲܝܢܵܐ ܘܒܲܫܠܵܡܵܐ

This repository contains the [Beth Mardutho Meltho fonts](http://bethmardutho.org/meltho/) and a script that will install the fonts to `$HOME/.fonts` and a fontconfig configuration file to `$HOME/.config/fontconfig/conf.d/`.

The script will customize the fontconfig configuration file for one of the three script styles: Estrangelo, Serto and East Syriac and it will default to the most common font for each script style. If you need further customizations, please look into the **65-fonts-syriac.conf** under `$HOME/.config/fontconfig/conf.d/`

The fontconfig configuration file will set the font to 2.0x the ***pixelsize*** of a similar latin font. This is needed because to the smaller letter size in Syriac fonts relative to latin. You can adjust this in the configuration file.

# Installation

```
chmod +x install.sh
./install.sh
```

# Regionalization

I have included a Syriac locale within the repository to localize your Linux environment. This is not automated in the script and may be sent to upstream GNU C Library project for inclusion after more testing. To install this on your system, perform the following commands in the `/locale/` directory:

* `sudo localdef -f UTF-8 -i syr syr`
* `sudo localectl set-locale LANG=syr.UTF-8`

# Questions, Comments, or Concerns?

Please feel free to contact me or send merge requests for any changes

ܒܲܣܝܼܡܵܐ ܪܵܒܵܐ
