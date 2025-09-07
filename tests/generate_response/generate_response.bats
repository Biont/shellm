#!/usr/bin/env bats

# Test script for generate_response function

setup() {
  # Set default environment variables if not set
  export API_URL="${API_URL:-http://localhost:11434/api}"
  export SHELLM_MODEL="${SHELLM_MODEL:-qwen2.5:3b-instruct-q5_K_M}"
  export NUM_PREDICT="${NUM_PREDICT:-500}"
  export VERBOSE="${VERBOSE:-2}"

}

teardown() {
  # Cleanup any files or pipes created during tests
  rm -f /tmp/SHELLM_CHAT /tmp/SHELLM_THINK
}

# Test: generate_response with a basic prompt
@test "generate_response with simple prompt" {
  # Define the test prompt
  local prompt="Why is the sky blue?"
  # Capture function output
  run ./shellm "$prompt"

  # Check status code
  [ "$status" -eq 0 ]

  # Check that some output was produced
  [[ -n "$output" ]]
}

# Test: generate_response with invalid API URL
@test "generate_response with invalid API URL" {
  export API_URL="http://invalid_url:1234/api"

  local prompt="Tell me a joke"

  # Run function and expect failure
  run ./shellm "$prompt"

  # Check status code for expected failure
  [ "$status" -ne 0 ]

  # Check for error output
  [[ "$output" == *"[ERROR]"* ]]
}

# Test: generate_response with piping from stdin
@test "generate_response with piping from stdin" {
  # Define the test prompt to be piped in
  local prompt="What is the capital of France?"

  # Run function and expect success
  run bats_pipe "$prompt" \| ./shellm

  # Check that some output was produced
  [[ -n "$output" ]]
}
