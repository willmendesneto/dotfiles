# Copy w/ progress
copy () {
  rsync -WavP --human-readable --progress $1 $2
}
