function Get-ModelNodes($model)
{

    $returnObject = @{}


    <#$qry = "SELECT GasNode.NodeId, GasNode.Pressure, GasNode.IsBoundaryActive, GasNodeControl.IsKnownFlow, GasNodeControl.IsKnownPressure FROM GasNode LEFT JOIN GasNodeControl ON GasNode.NodeId=GasNodeControl.NodeId"
    $Nodes = Query-DataBase -database $model -qry $qry

    $returnObject.Add("Nodes", $Nodes)


    # Descrips
    $qry = "SELECT NodeId, Description FROM NodeDescriptions"
    $NodeDescriptions = Query-DataBase -database $model -qry $qry

    $returnObject.Add("Descriptions", $NodeDescriptions)


    # Numbers
    $qry = "SELECT IdVal AS NodeId, StringVal FROM NodeNameIdMap"
    $NodeNumbers = Query-DataBase -database $model -qry $qry

    $returnObject.Add("Numbers", $NodeNumbers)


    # Symbols
    $qry = "SELECT NodeId, X, Y, SymbolId AS NodeSymbol FROM Node"
    $NodeSymbols = Query-DataBase -database $model -qry $qry

    $returnObject.Add("Symbols", $NodeSymbols)#>

    $qry = "SELECT GasNode.NodeID
    , GasNode.Pressure 
    , GasNode.IsBoundaryActive AS DG
    , NodeDescriptions.Description
    , NodeNameIdMap.StringVal AS NodeNumber
    , Node.X
    , Node.Y
    , Node.SymbolId AS Symbol
    , GasNodeDemand.Flow
    FROM ((((GasNode 
    LEFT JOIN NodeDescriptions ON GasNode.NodeId=NodeDescriptions.NodeId) 
    LEFT JOIN NodeNameIdMap ON GasNode.NodeId=NodeNameIdMap.IdVal) 
    LEFT JOIN Node ON GasNode.NodeId=Node.NodeId)
    LEFT JOIN GasNodeDemand ON GasNode.NodeId=GasNodeDemand.NodeId)"

    $modelinfo = Query-DataBase -database $model -qry $qry

    return $modelinfo

}
