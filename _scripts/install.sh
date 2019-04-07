#!/bin/bash
set -x # Show the output of the following commands (useful for debugging)
    
# Import the SSH deployment key
openssl aes-256-cbc -K $encrypted_f90a2ce3d0f4_key -iv $encrypted_f90a2ce3d0f4_iv -in deploy.enc -out deploy -d
rm deploy.enc # Don't need it anymore
chmod 600 deploy
mv deploy ~/.ssh/id_rsa
    
# Install zopfli
git clone https://code.google.com/p/zopfli/
cd zopfli
make
chmod +x zopfli
cd ..