#!/bin/sh
# fetch files
#
defaults()
{
    ver="9.2"
    filename="nextreports-designer-${ver}.zip"
    url="http://www.asf.ro/next_reports_releases/${filename}"
}

fetch_data()
{
    
    wget "${url}"
    unzip "${filename}"

}

defaults

fetch_data


