# A Virtual Reality Memory Palace Variant Aids Knowledge Retrieval from Scholarly Articles (in press)

<img src="VRMP-teaser.png">

**Authors**: Fumeng Yang, Jing Qian, Johannes Novotny, David Badre, Cullen D. Jackson, and David H. Laidlaw.  

**DOI**: 10.1109/TVCG.2020.3009003

**Abstract**: We present exploratory research of virtual reality techniques and mnemonic devices to assist in retrieving knowledge from
scholarly articles. We used abstracts of scientific publications to represent knowledge in scholarly articles; participants were asked to
read, remember, and retrieve knowledge from a set of abstracts. We conducted an experiment to compare participants’ recall and
recognition performance in three different conditions: a control condition without a pre-specified strategy to test baseline individual
memory ability, a condition using an image-based variant of a mnemonic called a “memory palace,” and a condition using a virtual
reality-based variant of a memory palace. Our analyses show that using a virtual reality-based memory palace variant greatly
increased the amount of knowledge retrieved and retained over the baseline, and it shows a moderate improvement over the other
image-based memory palace variant. Anecdotal feedback from participants suggested that personalizing a memory palace variant
would be appreciated. Our results support the value of virtual reality for some high-level cognitive tasks and help improve future
applications of virtual reality and visualization.

This repository provides experimental materials, data, analysis code, and videos.

This repository contains large files and uses [git lfs](https://git-lfs.github.com/) to manage and access the large files.
The VR experimental system is up to 7GB. If you need this system or a part of it, please email us.

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

The R scripts take the inputs from the data folder.

## Folder: videos

#### README-Video

It contains a transcript of each video.

#### Control-Video.mp4, IMMP-Video.mp4, and VRMP-Video.mp4

The videos to show the flow of the three conditions, respectively.

## Files: 
    - VRMP-TVCG-preprint.pdf
    - VRMP-propectus.pdf: a small project proposal 

## bibtex (temporary)
@article{yang2020vrmemorypalace,  
  title={A Virtual Reality Memory Palace Variant Aids Knowledge Retrieval from Scholarly Articles},   
  author={Yang, Fumeng and Jing, Qian and Novotny, Johannes, and Badre, David, and Jackson, Cullen D., and Laidlaw, David H.},      
  journal={IEEE transactions on visualization and computer graphics},   
  doi={10.1109/TVCG.2020.3009003},   
  year={2020},   
  publisher={IEEE}   
}

