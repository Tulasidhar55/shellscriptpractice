RED="\033[1;31m"
NC='\033[0m'
echo -e "${RED}***************BlockTrack BlockChain API Deployment Process Started*******************"
echo -e "***************Finding existing processes on PORT 3002 and 3000*******************${NC}"
kill -9 $(lsof -t -i:3002 -sTCP:LISTEN)
kill -9 $(lsof -t -i:3000 -sTCP:LISTEN)
echo -e "${RED}***************Existing Running Process found and killed***************${NC}"
cd
cd Projects/SCM_V1/SupplyChainManagement_0.01
ReleaseVersion=$(jq '.version' package.json | sed 's/"//g')
echo "this is the version present ${ReleaseVersion}"
composer archive create -t dir -n ./ -a blocktrack@test.bna
composer network install -c PeerAdmin@hlfv1 -a blocktrack@test.bna
composer network upgrade -c PeerAdmin@hlfv1 -n block-track -V ${ReleaseVersion} | sed 's/"//g'
composer network ping -c admin@block-track
composer-rest-server -c admin@block-track -n never -u true -d n -w true -p 3002 &
