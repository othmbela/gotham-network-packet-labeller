# Processing Pipeline: A Device-Level Distributed IoT Network Traffic Dataset with Non-IID Characteristics for Intrusion Detection

This repository contains a pipeline for processing the network traffic dataset, including **feature extraction**, **feature cleaning**, and **data labelling**. The pipeline is designed for extensibility and reproducibility.

---

## **Table of Contents**
1. [Installation](#installation)
2. [Pipeline Tasks](#pipeline-tasks)
3. [Usage](#usage)
4. [Files and Folders Structure](#files-and-folders-structure)
5. [Requirements](#requirements)
6. [License](#license)
7. [Authors](#authors)

---

## **Installation**

* Before running the pipeline, ensure you have **Python 3.8+** and **Tshark 4.2.2** golbally installed in your computer;*. If not, you can get python [here](https://www.python.org) and tshark [here](https://tshark.dev/setup/install/).
* Then, clone the repository to your PC:
    ```bash
        $ git clone https://github.com/othmbela/gotham-network-packet-labeller.git
    ```
* ### Dependencies
    1. cd into your cloned repository as such:
        ```bash
            $ cd gotham-network-packet-labeller
        ```
    2. Initialise the project as such:
        ```bash
            $ make init
        ```
    First, the command line will create your vcirtual environment and install the dependencies needed to run the app. Then, it will create the data folders.
    3. Move the dataset to the ./data/raw folder.


## **Pipeline Tasks**

The pipeline is divided into the following stages:

1. **Feature Extraction:** Converts raw network traffic data (e.g., pcap files) into feature datasets.
2. **Feature Cleaning:** Cleans and processes extracted features to ensure consistency.
3. **Data Labelling:** Labels the cleaned datasets with attack and benign traffic labels.
4. **Full Pipeline:** Executes all steps sequentially.


## **Usage**

### **Running Individual Steps**

You can run each stage of the pipeline individually using the Makefile. This allows you to perform specific steps as needed:

- Feature Extraction:
    ``` bash
    make extract_features
    ```
    This will extract features from raw network traffic data.

- Feature Cleaning:
    ``` bash
    make clean_features
    ```
    This will clean and preprocess the extracted feature datasets.

- Data Labelling:
    ``` bash
    make label_data
    ```
    This will label the cleaned datasets with appropriate attack/benign classifications.

### **Running the Full Pipeline**

To run all stages in sequence, execute the following command:
```bash
make run_pipeline
```

This will run feature extraction, feature cleaning, and data labelling one after the other, automating the entire pipeline.


## **Files and Folders Structure**

The pipeline expects the following directory structure:
```
    ├── bash_scripts/
    │
    ├── data/
    │   ├── raw/                     # Raw network traffic data (input)
    │   ├── extracted_features/      # Extracted features (output from feature extraction)
    │   ├── cleaned_features/        # Cleaned features (output from feature cleaning)
    │   └── labeled_data/            # Labeled data (output from labelling)
    │
    ├── features/
    ├── images/
    ├── metadata/
    ├── notebooks/
    │
    ├── scripts/
    │   ├── run_cleaning.py
    │   ├── run_extraction.py
    │   └── run_labelling.py
    │
    ├── src/
    │   ├── __init__.py
    │   ├── feature_cleaner.py
    │   ├── feature_extractor.py
    │   ├── labeller.py
    │   └── utils.py
    │
    ├── venv/
    ├── .dockerignore
    ├── .gitignore
    ├── Dockerfile
    ├── Makefile
    ├── README.md
    └── requirements.txt
```


## Requirements

All the experiments were conducted using a 64-bit Intel(R) Core(TM) i7-7500U CPU with 16GB RAM in Windows 10 environment.


## License

This project is released under the [Apache 2.0 license](LICENSE)


## Authors

**Othmane Belarbi**


## Citation

If you find this code useful in your research, please cite this article as:
```bibtex
@misc{belarbi2025gothamdataset2025reproducible,
      title={Gotham Dataset 2025: A Reproducible Large-Scale IoT Network Dataset for Intrusion Detection and Security Research}, 
      author={Othmane Belarbi and Theodoros Spyridopoulos and Eirini Anthi and Omer Rana and Pietro Carnelli and Aftab Khan},
      year={2025},
      eprint={2502.03134},
      archivePrefix={arXiv},
      primaryClass={cs.CR},
      url={https://arxiv.org/abs/2502.03134}, 
}
```

