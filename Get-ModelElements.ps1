function Get-ModelElements
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [System.String]$Model,
        [Parameter(Mandatory=$true)]
        [ValidateSet('Nodes','Pipes','Profiles')]
        [System.String]$Element = 'Nodes',
        [Parameter(Mandatory=$false)]
        [ValidateSet('All','DG','LowPoints','Demands')]
        [System.String]$NodeType = 'All',
        [Parameter(Mandatory=$false)]
        [ValidateSet('All','PE','Metal')]
        [System.String]$PipeType = 'All'
    )

    Try {

        ##*===============================================
        ##* VARIABLE DECLARATION
        ##*===============================================
        #region Variables



        #endregion
        ##*===============================================
        ##* END VARIABLE DECLARATION
        ##*===============================================

        Switch ($Element) {

            'Nodes' {

                Switch ($NodeType) {

                    'All' { $qry = "SELECT 
                    'DG'
                    'LowPoints'
                    'Demands'
                    

        ##*===============================================
        ##* NODES
        ##*===============================================




    $returnObject = @{}


    $qry = "SELECT GasNode.NodeId, GasNode.Pressure, GasNode.IsBoundaryActive, GasNodeControl.IsKnownFlow, GasNodeControl.IsKnownPressure FROM GasNode LEFT JOIN GasNodeControl ON GasNode.NodeId=GasNodeControl.NodeId"
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

    $returnObject.Add("Symbols", $NodeSymbols)

    return $returnObject

}
