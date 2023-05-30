public struct NodeDetailsResponse: Decodable {
    private let nodeDetails: AllNodeDetailsModel

    public init(nodeDetails: AllNodeDetailsModel) {
        self.nodeDetails = nodeDetails
    }

    public func getNodeDetails() -> AllNodeDetailsModel {
        return nodeDetails
    }
}
