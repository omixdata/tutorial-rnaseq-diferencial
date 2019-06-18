cd /tmp/
mkdir -p star-aligner
cd star-aligner

if [ -d STAR ]; then
	rm -r STAR
fi

git clone https://github.com/alexdobin/STAR/
chmod +x STAR/bin/Linux_x86_64/*
cp STAR/bin/Linux_x86_64/* /usr/local/bin/
cd ../
rm -r star-aligner
