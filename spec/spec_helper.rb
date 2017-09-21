require 'sfax'

def outbound_fax_response
    <<-HEREDOC
      <ReceiveOutboundFaxResponse xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
      <isSuccess>true</isSuccess>
      <message>Success</message>
      <OutboundFaxItems>
        <RecipientFaxStatus>
        <SendFaxQueueId/>
        <IsSuccess>true</IsSuccess>
        <ResultCode>0</ResultCode>
        <ErrorCode>0</ErrorCode>
        <ResultMessage>OK</ResultMessage>
        <RecipientName>Alameda3 County</RecipientName>
        <RecipientFax>1-5102592920</RecipientFax>
        <TrackingCode/>
        <FaxDateUtc>2017-09-20T22:08:00Z</FaxDateUtc>
        <FaxId>2170920220800997142</FaxId>
        <Pages>2</Pages>
        <Attempts>1</Attempts>
        <SenderFax>1-8443642620</SenderFax>
        <FaxSuccess>1</FaxSuccess>
        <OutboundFaxId>2170920220800997142</OutboundFaxId>
        <FaxPages>2</FaxPages>
        <FaxDateIso>2017-09-20T22:08:00Z</FaxDateIso>
        <WatermarkId>2170921000219997498</WatermarkId>
        </RecipientFaxStatus>
        <RecipientFaxStatus>
        <SendFaxQueueId>D62E48B7D0634523BED01381378FDE7C</SendFaxQueueId>
        <IsSuccess>false</IsSuccess>
        <ResultCode>6200</ResultCode>
        <ErrorCode>1624000</ErrorCode>
        <ResultMessage>No Faxtone</ResultMessage>
        <RecipientName>Alameda</RecipientName>
        <RecipientFax>1-5102592230</RecipientFax>
        <TrackingCode>LaterDocumentSubmitter 13660</TrackingCode>
        <FaxDateUtc>2017-09-21T16:22:36Z</FaxDateUtc>
        <FaxId>2170921162236997254</FaxId>
        <Pages>2</Pages>
        <Attempts>6</Attempts>
        <SenderFax>1-8443642620</SenderFax>
        <FaxSuccess>0</FaxSuccess>
        <OutboundFaxId>2170921162236997254</OutboundFaxId>
        <FaxPages>2</FaxPages>
        <FaxDateIso>2017-09-21T16:22:36Z</FaxDateIso>
        <WatermarkId>2170921192630997609</WatermarkId>
        </RecipientFaxStatus>
        <RecipientFaxStatus>
        <SendFaxQueueId>B3FBB323F5F84777973C1B590FFC1F94</SendFaxQueueId>
        <IsSuccess>false</IsSuccess>
        <ResultCode>6200</ResultCode>
        <ErrorCode>1624000</ErrorCode>
        <ResultMessage>No Faxtone</ResultMessage>
        <RecipientName>Alameda</RecipientName>
        <RecipientFax>1-5102592230</RecipientFax>
        <TrackingCode>LaterDocumentSubmitter 13688</TrackingCode>
        <FaxDateUtc>2017-09-21T18:11:11Z</FaxDateUtc>
        <FaxId>2170921181111997073</FaxId>
        <Pages>2</Pages>
        <Attempts>6</Attempts>
        <SenderFax>1-8443642620</SenderFax>
        <FaxSuccess>0</FaxSuccess>
        <OutboundFaxId>2170921181111997073</OutboundFaxId>
        <FaxPages>2</FaxPages>
        <FaxDateIso>2017-09-21T18:11:11Z</FaxDateIso>
        <WatermarkId>2170921220441997924</WatermarkId>
        </RecipientFaxStatus>
        </OutboundFaxItems>
      <FaxCount>19</FaxCount>
      <LastWatermark>2170921220441997924</LastWatermark>
      <HasMoreItems>false</HasMoreItems>
      </ReceiveOutboundFaxResponse>
     HEREDOC
  end