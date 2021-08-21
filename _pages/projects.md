---
layout: page
title: Projects
permalink: /projects/
---
(updated: 2021/06/01)
---

# Research Projects 
### SinForkGAN: ForkGAN with Single Rainy Night Images (03/2021 - 2021/06)
 *ForkGAN*[/doc/forkgan.pdf] has been proposed as a task agnostic image translation method that can boost the performance of multiple vision tasks
 in adverse weather conditions. The recently proposed *RumiGAN framework*[/doc/rumigan.pdf] is incorporated to get rid of daytime image translation
 module in ForkGAN. This project was conducted for class "Advanced GANs" in Seoul National University. 
 - [code](https://github.com/sally20921/SinForkGAN)
 - [paper](/doc/sinforkgan.pdf)
 
### Unsupervised Domain Adaptation on Mobile/Edge Devices (05/2020 - 2021/02)  
This project aims to develop an unsupervised domain adaptation algorithm that improves the state-of-the-art algorithm. 
- [code(reproduction of SimCLR)](https://github.com/sally20921/simclr.git)
- [code(reproduction of MSTN)](https://github.com/sally20921/MSTN.git)
- [code(reproduction of SCL)](https://github.com/sally20921/SupervisedContrastive.git)
- [code(reproduction of DSBN)](https://github.com/sally20921/DSBN.git)

### Development of Character-Centered Video Story Understanding Algorithm for Hierarchical QA with DramaQA Dataset
This project aims to develop an algorithm for a Video QA Challenge called 'DramaQA'. 
- [code1](https://github.com/sally20921/MDANforDramaQA2019)
- [code2](https://github.com/sally20921/dramaqa2020)
- [paper](/doc/dramaQA/dramaQA_paper.pdf)

### Development of a Key Value Store that supports LevelDB API for Key Value SSDs (09/2019 - 05/2020)
This project aims to design a LevelDB-like key-value store that supports range queries, snapshots, etc. for KV SSDs. By replacing block SSD with KV SSD and designing a software layer to provide more operations mentioned above, this project achieves significant performance improvement compared to state-of-the-art LSM-tree based key-value store such as LevelDB. Here is a slide that describes the characteristics of KVSSD: [link](https://www.systor.org/2019/slides/S8P1%20Towards%20Building%20a%20High-performance,%20Scale-in%20Key-value%20Storage%20System.pdf)
- [paper1](/doc/KVSSD/LevelDB_paper.pdf) 
- [paper2](/doc/KVSSD/LevelKV.pdf)
- [paper3](/doc/KVSSD/LevelKV_star.pdf)

### Building A Multi-Behavior Recommendation System Using Attention Mechanism, Data Mining Laboratory (01/2020 - 02/2020)
Given user behavior data of multiple types, this project aims to predict users' next behaviors of target type. An algorithm was created that captures the sequential patterns by using multihead attention mechanism. This algorithm improves the previous algorithm that was designed by using RNN (recurrent neural networks). Here is a paper about Recommendation System that was originally designed with RNN : [link](https://arxiv.org/pdf/1511.06939.pdf)
- [code](https://github.com/sally20921/Multi-Behavior-Recommendation-System)
- [paper review](/doc/ATRank/paper_review.pdf)
- [presentation](/doc/ATRank/presentation.pdf)

### Development of End-to-End Lyric Alignment Algorithm, Music and Audio Research Group (07/2019 - 08/2019)
In the last decade, there has been considerable interest in digital music services that display the lyrics of songs that are synchronized with their audio. This project aims to develop an automatic lyrics-to-audio alignment system that could reduce huge amount of time and labor required to manually construct lyric time stamps. Here is the paper that provided the baseline for this project: [link](https://arxiv.org/pdf/1902.06797.pdf)
- [code](https://github.com/sally20921/lyric_alignment.git)
- [report1](/doc/LyricAlignment/report1.pdf)

### GWAJAMS Full Stack Development, Naver Hackerton (03/2019 - 02/2020)
This project aims to develop a website using React/Redux for frontend, and Python Django for backend. 
The website GWAJAMS helps a specific organization design, comment, and vote on uniforms they want to design.

- [wiki](https://github.com/swapp201901-team9/frontend/wiki/Design-and-Planning)
- [code_frontend](https://github.com/swapp201901-team9/frontend)
- [code_backend](https://github.com/swapp201901-team9/backend)
- [report](/doc/GWAJAMS/paper.pdf)
- [poster](/doc/GWAJAMS/poster.png)
- [picture](/doc/GWAJAMS/pic.jpeg)

### Development of HDR Algorithm, LG Display (09/2018 - 12/2018)
This project aims to develop an full Android application of HDR (high dynamic range) camera. 
We modified Exposure Fusion algorithm and developed a new HDR algorithm to get better result images. 
The exposure fusion algorithm was developed by Tom Mertens, Jan Kautz, Frank Van Reeth from Hasselt University and University College London. Here is a link to their paper: [link](https://mericam.github.io/papers/exposure_fusion_reduced.pdf)

- [code](https://github.com/peterhyun/ExposureFusion_Android) 
- [report](/doc/HDR/HDR_paper.pdf)
- [poster1](/doc/HDR/presentation1.jpeg)
- [poster2](/doc/HDR/presentation2.jpeg)
- [picture](/doc/HDR/pic.jpeg)
