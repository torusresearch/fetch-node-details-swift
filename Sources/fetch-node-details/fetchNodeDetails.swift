//
//  File.swift
//  
//
//  Created by Shubham on 13/3/20.
//

import Foundation
import Web3
import Web3ContractABI

//package us.tor.fetchnodedetails;
//
//
//import org.web3j.crypto.Credentials;
//import org.web3j.protocol.Web3j;
//import org.web3j.protocol.http.HttpService;
//import org.web3j.tuples.generated.Tuple6;
//import org.web3j.tuples.generated.Tuple7;
//import org.web3j.tx.gas.DefaultGasProvider;
//import org.web3j.utils.Numeric;
//import us.tor.fetchnodedetails.types.*;
//
//import java.math.BigInteger;
//import java.util.Arrays;
//import java.util.List;
//import java.util.concurrent.CompletableFuture;
//import java.util.stream.Collectors;

public class FetchNodeDetails {
    
    private var network : EthereumNetwork = EthereumNetwork.MAINNET;
    private var proxyAddress : String = "0x638646503746d5456209e33a2ff5e3226d698bea";
    //    private var  proxyContract:NodeListProxy;
    //private var  nodeDetails : NodeDetails;
    
    //    public FetchNodeDetails() {
    //        this.setupWeb3();
    //    }
    
    //    init( network : EthereumNetwork, proxyAddress: String) {
    //        self.network = network;
    //        self.proxyAddress = proxyAddress;
    //        //self.nodeDetails = NodeDetails();
    //        self.setupWeb3();
    //    }
    public init(){
        self.setupWeb3()
    }
    
    //    public static void main(String[] args) {
    //        FetchNodeDetails fetchNodeDetails = new FetchNodeDetails();
    //        try {
    //            // var epoch = fetchNodeDetails.getCurrentEpoch().get();
    //            NodeDetails nodeDetails = fetchNodeDetails.getNodeDetails().get();
    //            String[] epoch = nodeDetails.getTorusNodeEndpoints();
    //            Arrays.stream(epoch).forEach(x -> System.out.println(x));
    //
    //        } catch (Exception e) {
    //            System.out.println(e.toString());
    //        }
    //        System.out.println("Hello world from fetch node details");
    //    }
    
    //    public CompletableFuture<BigInteger> getCurrentEpoch() {
    //        return this.proxyContract.currentEpoch().sendAsync();
    //    }
    //
    //    public CompletableFuture<EpochInfo> getEpochInfo(BigInteger epoch) {
    //        return this.proxyContract.getEpochInfo(epoch).sendAsync()
    //                .thenComposeAsync(
    //                        (Tuple7<BigInteger, BigInteger, BigInteger, BigInteger, List<String>, BigInteger, BigInteger> result) -> CompletableFuture.supplyAsync(() ->
    //                                new EpochInfo(result.component1().toString(), result.component2().toString(), result.component3().toString(),
    //                                        result.component4().toString(), result.component5().toArray(new String[0]),
    //                                        result.component6().toString(), result.component7().toString())
    //                        )
    //                );
    //    }
    //
    //    public CompletableFuture<NodeInfo> getNodeEndpoint(String nodeEthAddress) {
    //        return this.proxyContract.getNodeDetails(nodeEthAddress).sendAsync().thenComposeAsync(
    //                (Tuple6<String, BigInteger, BigInteger, BigInteger, String, String> result) -> CompletableFuture.supplyAsync(() ->
    //                        new NodeInfo(result.component1(), result.component2().toString(), result.component3().toString(),
    //                                result.component4().toString(), result.component5(), result.component6())
    //                )
    //        );
    //    }
    //
    //    public CompletableFuture<NodeDetails> getNodeDetails() {
    //        if (this.nodeDetails.getUpdated()) return CompletableFuture.supplyAsync(() -> this.nodeDetails);
    //        return this.getCurrentEpoch().thenComposeAsync((epoch) -> {
    //            this.nodeDetails.setNodeListAddress(this.proxyAddress);
    //            this.nodeDetails.setCurrentEpoch(epoch.toString());
    //            return this.getEpochInfo(epoch);
    //        }).thenComposeAsync((latestEpochInfo) -> {
    //            String[] nodeList = latestEpochInfo.getNodeList();
    //            BigInteger[] _torusIndexes = new BigInteger[nodeList.length];
    //            CompletableFuture<NodeInfo>[] futures = new CompletableFuture[nodeList.length];
    //            for (int i = 0, size = nodeList.length; i < size; i++) {
    //                _torusIndexes[i] = new BigInteger(Integer.toString(i + 1));
    //                futures[i] = this.getNodeEndpoint(nodeList[i]);
    //            }
    //            this.nodeDetails.setTorusIndexes(_torusIndexes);
    //            CompletableFuture<Void> allFutures = CompletableFuture.allOf(futures);
    //            return allFutures.thenComposeAsync(v -> CompletableFuture.supplyAsync(() -> Arrays.stream(futures).map(CompletableFuture::join).collect(Collectors.toList()))
    //            );
    //        }).thenComposeAsync((nodeEndPointsList) -> {
    //            NodeInfo[] nodeEndPoints = nodeEndPointsList.toArray(new NodeInfo[0]);
    //            String[] updatedEndpoints = new String[nodeEndPoints.length];
    //            TorusNodePub[] updatedNodePub = new TorusNodePub[nodeEndPoints.length];
    //            for (int i = 0, size = nodeEndPoints.length; i < size; i++) {
    //                NodeInfo endPointElement = nodeEndPoints[i];
    //                String endpoint = "https://" + endPointElement.getDeclaredIp().split(":")[0] + "/jrpc";
    //                updatedEndpoints[i] = endpoint;
    //                updatedNodePub[i] = new TorusNodePub(Numeric.toHexStringNoPrefix(endPointElement.getPubKx().getBytes()),
    //                        Numeric.toHexStringNoPrefix(endPointElement.getPubKy().getBytes()));
    //            }
    //            this.nodeDetails.setTorusNodeEndpoints(updatedEndpoints);
    //            this.nodeDetails.setTorusNodePub(updatedNodePub);
    //            this.nodeDetails.setUpdated(true);
    //            return CompletableFuture.supplyAsync(() -> this.nodeDetails);
    //        });
    //    }
    
    private func setupWeb3() {
        let web3 = Web3(rpcURL: self.getProxyUrl());
        let contractAddress = try! EthereumAddress(hex: self.proxyAddress, eip55: false)
        let contract = try! web3.eth.Contract(json: Data(contractABIString.utf8), abiKey: nil, address: contractAddress)
        print(contract)
    }
    
    private func getProxyUrl() -> String{
        return "https://api.infura.io/v1/jsonrpc/" + self.network.rawValue;
    }
}
