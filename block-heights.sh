# echo; echo "blockchain-etl:"
# $HOME/blockchain-etl/blockchain_etl info height

echo; echo "miner:"
docker exec miner miner info height

echo; echo "Helium API:"
curl -s https://api.helium.io/v1/stats | jq -r '.data .counts .blocks'

echo
