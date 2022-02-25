#Procédure :
cd C:\Users\hhoar\PycharmProjects\metaplex

echo "Création de la clé"
solana-keygen new --outfile ./solana/devnet.json
solana config set --keypair ./solana/devnet.json
solana config set --url https://metaplex.devnet.rpcpool.com/
solana config get

#voir https://www.reddit.com/r/solana/comments/ree3z7/airdrop_request_failed_on_the_solana_devnet/
solana airdrop 2 DsYA7Srkd369a7TWyNCpV56CpHa4sbygSFZJ7aAVTtCL --url https://api.devnet.solana.com
solana airdrop 2 G5ysqbh9ofjrqkfcvYHVbPToJe77dpq1oh2J9NTKoyEQ --url https://api.devnet.solana.com
solana balance DsYA7Srkd369a7TWyNCpV56CpHa4sbygSFZJ7aAVTtCL

cd C:\Users\hhoar\PycharmProjects\metaplex\

ts-node ./js/packages/cli/src/candy-machine-v2-cli.ts upload -e devnet -k ./solana/devnet.json -cp ./config.json -c example ./assets
ts-node ./js/packages/cli/src/candy-machine-v2-cli.ts verify_upload -e devnet -k ./solana/devnet.json -c example
cd C:\Users\hhoar\PycharmProjects\metaplex\js\packages\web
yarn start

echo "Minage des tokens"
ts-node ./js/packages/cli/src/candy-machine-v2-cli.ts mint_one_token -e devnet -k ./solana/devnet.json -c example
