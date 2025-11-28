# Define variables for directories and scripts
VENV = venv
BIN = $(VENV)/bin
EXTRACT_SCRIPT = ./scripts/run_extraction.py
CLEAN_SCRIPT = ./scripts/run_cleaning.py
LABEL_SCRIPT = ./scripts/run_labelling.py


ifeq ($(OS), Windows_NT)
	BIN=$(VENV)/scripts
endif


# Phony targets (tasks that don't correspond to file names)
.PHONY: init extract_features clean_features label_data run_pipeline


$(BIN)/activate: requirements.txt
	python3 -m venv $(VENV)
	$(BIN)/pip install --upgrade pip
	$(BIN)/pip install -e .


init: $(BIN)/activate
	mkdir -p ./data/raw/benign
	mkdir -p ./data/raw/malicious/coap-amplificator
	mkdir -p ./data/raw/malicious/network-scanning
	mkdir -p ./data/raw/malicious/merlin
	mkdir -p ./data/raw/malicious/mirai-dos
	mkdir -p ./data/raw/malicious/mirai-infection
	mkdir -p ./data/extracted_features/benign
	mkdir -p ./data/extracted_features/malicious/coap-amplificator
	mkdir -p ./data/extracted_features/malicious/network-scanning
	mkdir -p ./data/extracted_features/malicious/merlin
	mkdir -p ./data/extracted_features/malicious/mirai-dos
	mkdir -p ./data/extracted_features/malicious/mirai-infection
	mkdir -p ./data/labelled/benign
	mkdir -p ./data/labelled/malicious/coap-amplificator
	mkdir -p ./data/labelled/malicious/network-scanning
	mkdir -p ./data/labelled/malicious/merlin
	mkdir -p ./data/labelled/malicious/mirai-dos
	mkdir -p ./data/labelled/malicious/mirai-infection
	mkdir -p ./data/processed


# Feature extraction
extract_features:
	@echo "Running feature extraction..."
	python3 $(EXTRACT_SCRIPT)


# Feature cleaning
clean_features: extract_features
	@echo "Running feature cleaning..."
	python3 $(CLEAN_SCRIPT)


# Labelling
label_data: clean_features
	@echo "Running labelling..."
	python3 $(LABEL_SCRIPT)


# Run all steps of the pipeline
run_pipeline: extract_features clean_features label_data
	@echo "Pipeline completed!"


clean:
	rm -rf $(VENV)
	find . | grep -E "(/__pycache__)" | xargs rm -rf
