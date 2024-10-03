public struct NodeDetailsResponse: Decodable {
    private let nodeDetails: NodeDetails

    public init(nodeDetails: NodeDetails) {
        self.nodeDetails = nodeDetails
    }

    public func getNodeDetails() -> NodeDetails {
        return nodeDetails
    }
}
