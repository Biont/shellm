# Shellm: A Simple Ollama Client

![shellm header image](https://github.com/user-attachments/assets/013184c1-56d7-4fb5-ad7f-7adb2970b77f)

**Shellm** is a lightweight client for interacting with the [Ollama](https://ollama.com/) API, written entirely in a single Bash script. It provides a simple interface to generate responses from language models, interact with custom tools, and integrate AI capabilities into everyday Linux workflows.

## Features

- **Single File Script**: No complex dependencies—just a single Bash file.
- **API Integration**: Interacts with an Ollama API server to generate predictions.
- **Model Download**: Transparently instructs Ollama to download unknown models
- **Piping and Chaining**: Seamless integration into shell commands for input/output manipulation.
- **Verbose Mode**: Detailed debugging for troubleshooting or learning.

## Installation

1. Save the `shellm` Bash script to a directory of your choice, e.g., `/usr/local/bin`.
2. Make the script executable:
   ```bash
   chmod +x /usr/local/bin/shellm
   ```
3. Download the [config YAML](https://github.com/Biont/shellm/blob/main/config.yaml) and place it in [one of the recognized paths](https://github.com/Biont/shellm/blob/0141e467e96c6c06d30423bc292282d256a0d5b3/shellm#L68)
4. Ensure the Ollama API is running on `localhost:11434` or set the `API_URL` environment variable to your specific endpoint.

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
| `-v [0-2]` | Log level (verbosity) mode for debugging                                                            |
| `prompt`   | The prompt for the model. If reading from stdin, this will prepend to the input.                    |

### Example Commands

#### Simple Prompt
Generate a response to a simple question:
```bash
shellm "Why is the sky blue?"
```

#### Custom Model
Use a different model:
```bash
shellm -m "newmodel-v1:6b" "Summarize the plot of 'The Great Gatsby'."
```

#### Use Tools
Enable tool usage mode:
```bash
shellm "Translate the following text to French: 'Hello, how are you?'"
```

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

#### Example: AI-Powered Directory Listing
Generate a human-readable summary of files in a directory:
```bash
ls -l | shellm "Explain what these files are."
```

#### Example: Translating System Logs
To translate system logs to another language:
```bash
journalctl -xe | shellm "Translate this to Spanish."
```

## Environment Variables

| Variable        | Description                                   | Default                              |
|-----------------|-----------------------------------------------|--------------------------------------|
| `API_URL`       | URL of the Ollama API                          | `http://localhost:11434/api`         |
| `MODEL_SMALL`   | Default model to use                           | `qwen2.5:3b-instruct-q5_K_M`         |
| `VERBOSE`       | Enable verbose output                          | `0`                                  |

## Debugging

For verbose output, use the `-v` flag and specify the desired log level:

 * `-v 0` - Errors only
 * `-v 1` - Add warnings
 * `-v 2` - Add debug output

```bash
shellm -v 2 "Debug the script behavior."
```
## About the name

Apart from banking on the significant overlap between "shell" and "llm", the name "Shellm" is also extremely close in spelling and pronunciation to the German word "Schelm", which means "rogue", or "jokester".
This adds charm and character to the tool, so bear this in mind when it fails spectacularly.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests for bug fixes or new features.

## License

Shellm is released under the GPL License. See the [LICENSE](LICENSE) file for more details.

Enjoy using Shellm to bring AI capabilities directly into your shell! 😊
