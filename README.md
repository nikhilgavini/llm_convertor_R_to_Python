# R to Python Code Converter

An AI-powered tool that automatically converts R code to optimized Python, with performance benchmarking to demonstrate speedups.

## Project Overview

This project uses Large Language Models (LLMs) to convert R code into high-performance Python code while maintaining identical functionality and output. 
The tool includes a Gradio interface for easy interaction and side-by-side performance comparisons.

### Why This Matters

- **Modernization**: Many companies are transitioning legacy R codebases to Python
- **Speed**: Automated conversion saves significant development time
- **Performance**: Generated Python code often runs faster than the original R code
- **Validation**: Built-in execution and comparison ensures output correctness

## Features

- **Multi-Model Support**: Test conversions across different LLMs (GPT, Gemini, Groq models)
- **Performance Benchmarking**: Automatic timing comparison between R and Python execution
- **Interactive UI**: Clean Gradio interface for easy code conversion
- **Sample Templates**: Pre-loaded R code examples covering common data manipulation tasks
- **Output Validation**: Side-by-side output comparison to verify correctness
- **Optimized Code**: Leverages numpy, pandas, and other efficient Python libraries

## Getting Started

### Prerequisites

- Python 3.8+
- R (for R code execution comparison)
- API keys for at least one of: OpenAI, Google (Gemini), or Groq

### Installation

#### For Google Colab

Run these commands in your notebook:

```python
# Install R and rpy2
!apt-get update -qq
!apt-get install -y r-base r-base-dev
!pip install rpy2

# Install R packages (optional but recommended)
!Rscript -e "install.packages(c('dplyr', 'ggplot2'), repos='https://cloud.r-project.org', quiet=TRUE)"

# Install Python dependencies
!pip install openai gradio python-dotenv transformers
```

#### For Local Development

```bash
# Clone the repository
git clone <your-repo-url>
cd r-to-python-converter

# Install Python dependencies
pip install openai gradio python-dotenv transformers rpy2

# Ensure R is installed on your system
# For Ubuntu/Debian:
sudo apt-get install r-base r-base-dev

# For macOS:
brew install r

# For Windows:
# Download from https://cran.r-project.org/bin/windows/base/
```

### API Setup

Create API keys from your chosen providers and add them to your environment:

**For Google Colab**: Add secrets in the left sidebar (key icon):
- `OPENAI_API_KEY`
- `GEMINI_API_KEY`
- `GROQ_API_KEY`
- `HF_TOKEN` (if using HuggingFace models)

**For Local Development**: Create a `.env` file:

```env
OPENAI_API_KEY=your_openai_key_here
GEMINI_API_KEY=your_gemini_key_here
GROQ_API_KEY=your_groq_key_here
```

## Usage

1. **Launch the notebook** and run all cells
2. **Select a model** from the dropdown (tested models shown below)
3. **Paste or select R code** (use template buttons for examples)
4. **Click "Convert to Python"** to generate optimized Python code
5. **Click "Compare Both"** to see performance metrics

### Example Workflow

```python
# Input R code:
library(dplyr)
df %>%
  filter(value > 100) %>%
  group_by(category) %>%
  summarise(mean_value = mean(value))

# Output: Optimized Python code using pandas
# Plus: Performance comparison showing speedup factor
```

## Tested Models

The following models were evaluated for code conversion quality and speedup performance:

| Model | Provider | Avg Speedup | Notes |
|-------|----------|-------------|-------|
| `openai/gpt-oss-120b` | Groq | **7.41x** | Best overall performance |
| `gpt-5-nano` | OpenAI | 5.24x | Good balance of speed/cost |
| `gemini_2.5-flash-lite` | Google | - | Fast, budget-friendly |
| `qwen2.5-coder` | Ollama | - | Local execution |
| `deepseek-coder-v2` | Ollama | - | Local execution |

### Benchmark Results (8 Test Cases)

Detailed speedup factors for **openai/gpt-oss-120b**:

- Basic Select: **6.61x faster**
- Filter DataFrame: **10.44x faster**
- Mutate DataFrame: **10.35x faster**
- Arrange: **10.86x faster**
- Group By: **4.10x faster**
- Window Functions: **5.92x faster**
- Distinct: **5.75x faster**
- Summarize: **3.24x faster**

## Sample R Code Templates

The tool includes 8 pre-loaded R code examples covering common `dplyr` operations:

1. **Basic Select**: Column selection and renaming
2. **Filter**: Row filtering with multiple conditions
3. **Mutate**: Creating new calculated columns
4. **Arrange**: Sorting data
5. **Group By**: Aggregation by groups
6. **Window Functions**: Group-wise calculations
7. **Distinct**: Finding unique combinations
8. **Summarize**: Summary statistics with NA handling

## Project Structure

```
R_to_Python_Convertor.ipynb
├── STEP 0: Setup (Installs, Imports, API Configuration)
├── STEP 1: Prompt Engineering (System & User Prompts)
├── STEP 2: Code Generation Logic
│   ├── Conversion Function
│   ├── R Execution Function
│   ├── Python Execution Function
│   └── Comparison Function
├── STEP 3: Gradio UI (Interactive Interface)
├── STEP 4: Sample R Code (8 Templates)
└── STEP 5: Testing Results (Benchmark Data)
```

## Technical Details

### Conversion Strategy

The system prompt instructs LLMs to:
- Use efficient libraries (numpy, pandas, scipy)
- Vectorize operations where possible
- Maintain identical output format
- Include necessary imports
- Add explanatory comments
- Optimize for speed over compilation time

### Execution Environment

- **R Code**: Executed via `rpy2` with output capture using `sink()`
- **Python Code**: Executed via `exec()` with captured stdout
- **Timing**: High-precision timing with `time.time()`
- **Safety**: Isolated execution environments for each language

## Limitations & Considerations

- **Output Verification Required**: Always validate converted code before production use
- **Complex Code**: Very complex R code may require manual refinement
- **Package Dependencies**: Some R packages may not have direct Python equivalents
- **Statistical Functions**: Statistical functions may have subtle behavioral differences
- **Cost**: API calls to commercial LLMs incur costs (use nano/lite models for budget-conscious work)

## Future Work:

- [ ] Add support for more LLM providers
- [ ] Expand test case coverage
- [ ] Add support for R Markdown conversion
- [ ] Implement caching for repeated conversions
- [ ] Add code quality metrics beyond timing
- [ ] Support for custom R packages
