# On Mac.
if [[ "$OSTYPE" = darwin* ]]; then
  GIT_KRAKEN=/Applications/GitKraken.app/Contents/MacOS/GitKraken

  # Only if GitKraken is installed.
  if [[ -x "$GIT_KRAKEN" ]]; then
    command -v GitKraken >/dev/null 2>&1 || alias GitKraken=$GIT_KRAKEN
  fi
fi
