# A Virtual Reality Memory Palace Aids Knowledge Retrieval

This repository contains experimental materials, data, and analysis code for the manuscript ``A Virtual Reality Memory Palace Aids Knowledge Retrieval`` by Fumeng Yang, Jing Qian, Johannes Novotny, David Badre, Cullen D. Jackson, and David H. Laidlaw.

This repository contains large files and uses [git lfs](https://git-lfs.github.com/) to manage the large files.

## Folder: experiment

It is a Node.js application based on [experimentr](https://github.com/codementum/experimentr). The experiment consists of the instructions and experimental procedure.


## Folder: data

#### meta/all.csv 

The responses collected from participants, used for analyses. 

Note that we withhold a few minor columns (e.g., participants' majors). We have released their age and gender. It would be too easy to identify them if we continue releasing their majors, especially given that some of them were double- or triple-major.


#### raw recalls/Passages0-12.txt

It contains the recalled passages from participants.
Passages0 contains blank recall.

#### vr_data.csv

The logged movements and events from the HMD.

## Folder: analysis

The main (entry) file is main.R. All the dependencies have been specified in helper.R.

