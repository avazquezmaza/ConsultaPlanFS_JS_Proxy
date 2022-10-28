xquery version "3.0" encoding "UTF-8";

declare namespace ns0 = "http://telefonica.com/globalIntegration/services/CreateInteraction/v1";
declare namespace xf = "http://tempuri.org/APP_Movil/Resources/Common/xquery/CreateInteractionRq/";

declare function xf:CreateInteractionRq($primaryTelephoneNumber as xs:string,
    $contactTypePartyAccountContact as xs:string,
    $descriptionBusinessInteraction as xs:string)
    as element(ns0:createInteractionRequest) {
        <ns0:createInteractionRequest>
            <ns0:taskRequestIItem>
                <ns0:ModalityDesc>0</ns0:ModalityDesc>
                <ns0:primaryTelephoneNumber>{ $primaryTelephoneNumber }</ns0:primaryTelephoneNumber>
                <ns0:IDGeographicAddress>0</ns0:IDGeographicAddress>
                <ns0:contactTypePartyAccountContact>{ $contactTypePartyAccountContact }</ns0:contactTypePartyAccountContact>
                <ns0:descriptionBusinessInteraction>{ $descriptionBusinessInteraction }</ns0:descriptionBusinessInteraction>
            </ns0:taskRequestIItem>
        </ns0:createInteractionRequest>
};

declare variable $primaryTelephoneNumber as xs:string external;
declare variable $contactTypePartyAccountContact as xs:string external;
declare variable $descriptionBusinessInteraction as xs:string external;

xf:CreateInteractionRq($primaryTelephoneNumber,
    $contactTypePartyAccountContact,
    $descriptionBusinessInteraction)