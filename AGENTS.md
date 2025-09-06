# Shellm

Shellm is a lightweight client for interacting with the Ollama API, written entirely in a single Bash script. 
It provides a simple interface to generate responses from language models, interact with custom tools, and integrate AI capabilities into everyday Linux workflows.

## Specs

### It is self-contained
It works with pure bash and coreutils and is contained all within one file.

## Testing

This repository contains test cases in the tests/ folder 


## Usage

### Basic Command
```bash
shellm "What is the weather like today?"
```

This will generate a response using the default model.

### Options

| Option     | Description                                                                                         |
|------------|-----------------------------------------------------------------------------------------------------|
| `-u`       | API URL (default: `http://localhost:11434/api`)                                                     |
| `-m`       | Model name (default: `qwen2.5:3b-instruct-q5_K_M`)                                                  |
| `-n`       | Number of predictions to generate (default: `200`)                                                  |
| `-v [0-3]` | Log level (verbosity) mode for debugging                                                            |
| `prompt`   | The prompt for the model. If reading from stdin, this will prepend to the input.                    |

## Advanced Usage

### Chaining Multiple Invocations

Shellm supports chaining multiple invocations, allowing the user to pass the output of one command as the input to the next. This is useful for refining AI responses or handling complex tasks:

```bash
response=$(shellm "What is the capital of France?")
shellm "Is $response a popular tourist destination?"
```

### Integration with Linux Tasks

Shellm can be easily integrated into daily Linux workflows using piping. Here are a few examples:

#### Example: File Content Summarization
To summarize the contents of a file:
```bash
cat myfile.txt | shellm "Summarize this text"
```

