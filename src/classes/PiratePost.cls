public class PiratePost {
	
    public string chatterPost { get; set;}
    
    public void postToPirate() {
        
        //callout to get translation
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://isithackday.com/arrpi.php?text='+EncodingUtil.urlEncode(chatterPost, 'UTF-8'));
        req.setMethod('GET');
        HttpResponse res = new Http().send(req);
        
        //create feed post
        FeedItem fi = new FeedItem( );
        fi.ParentId = UserInfo.getUserId();
        fi.Body = res.getBody();
        insert fi;
    }
}