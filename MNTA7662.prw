#INCLUDE "PROTHEUS.CH"
#INCLUDE 'FWMVCDEF.CH'

//------------------------------------------------------------------- 
/*/{Protheus.doc} MNTA7662
Ponto de Entrada para adicionar op��o no menu MNTA766
          
@author      	Alex Teixeira de Souza
@version 	  	P11
@obs      		Referente ao projeto 
@return      	Nil
        
Alteracoes Realizadas desde a Estruturacao Inicial 
Data         Programador          Motivo 
/*/ 
//------------------------------------------------------------------ 
User Function MNTA7662()
Local aRotina := paramixb[1]

Aadd(aRotina, { "Copia","U_FSMN766CPY", 0, 9, 0,.F.})
           
Return aRotina

//------------------------------------------------------------------- 
/*/{Protheus.doc} FSMN766CPY
Rotina de copia de infra��o
          
@author      	Alex Teixeira de Souza
@version 	  	P11
@obs      		Referente ao projeto 
@return      	Nil
        
Alteracoes Realizadas desde a Estruturacao Inicial 
Data         Programador          Motivo 
/*/ 
//------------------------------------------------------------------
User Function FSMN766CPY()
    Local aArea        := GetArea()
    Local cTitulo      := "C�pia"
    Local cPrograma    := "MNTA766"
    Local nOperation   := MODEL_OPERATION_INSERT

    //Caso precise testar em algum lugar
    __lCopia     := .T.
     
    //Carrega o modelo de dados
    oModel := FWLoadModel(cPrograma)
    oModel:SetOperation(nOperation) // Inclus�o
    oModel:Activate(.t.) // Ativa o modelo com os dados posicionados


    oModel:SetValue('MULTAS','TRX_ZNUMAI',"")
    oModel:SetValue('MULTAS','TRX_MULTA',"")
    oModel:SetValue('MULTAS','TRX_CODINF',"500")    

 //   oModel:SetValue("TRX_CODINF"	,"")
 //   oModel:SetValue("TRX_ZNUMAI"	,"")
 //   oModel:SetValue("TRX_MULTA"	    ,"")

    //Pegando os dados do MVC
    //oStruct    := oModel:GetStruct()
    //aCampos    := oStruct:GetFields()

    //Percorrendo as colunas
    //For nCol := 1 To Len(aCampos)
    //    lTeste := .t.
    //Next nCol    

     
    //Executando a visualiza��o dos dados para manipula��o
    nRet     := FWExecView( cTitulo , cPrograma, nOperation, /*oDlg*/, {|| .T. } ,/*bOk*/ , /*nPercReducao*/, /*aEnableButtons*/, /*bCancel*/ , /*cOperatId*/, /*cToolBar*/, oModel )
    __lCopia := .F.
    oModel:DeActivate()
     
    //Se a c�pia for confirmada
    If nRet == 0
        MsgInfo("C�pia confirmada!", "Aten��o")
    EndIf
     
    RestArea(aArea)
Return oModel

