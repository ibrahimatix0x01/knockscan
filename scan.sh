TARGET=$1
if ! [ $TARGET ]; then
  echo "[!] No target provided."
  echo ">> $0 <example.com>"
  exit 1
fi
knockknock -n $TARGET -p
subfinder -dL domains.txt -silent | anew -q targets.txt
cat targets.txt | httprobe > probed.txt
nuclei -list probed.txt -o final.txt
