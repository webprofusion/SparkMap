//
//  OCMObjectModels.swift
//  SparkMap
//
//  Created by Christopher Cook on 13/09/2015.
//  Copyright © 2015 Christopher Cook. All rights reserved.
//

import Foundation
import JSONJoy

struct POIList : JSONJoy {
    var list: Array<OCMChargePoint>?
    init() {
    }
    init(_ decoder: JSONDecoder) {
        decoder.getArray(&list) //pass the optional array by reference, it will be allocated if it is not and filled
    }
}

struct OCMDataProvider: JSONJoy{
    var ID: Int
    var Title: String?
    
    init() {
        ID=0
    }
    init(_ decoder: JSONDecoder) {
        ID = decoder["ID"].integer!
        Title = decoder["Title"].string!
        
    }
}
struct OCMOperatorInfo : JSONJoy {
    var ID: Int
    var Title:String?
    
    init() {
        ID=0
    }
    init(_ decoder: JSONDecoder) {
        ID = decoder["ID"].integer!
        Title = decoder["Title"].string!
        
    }
}
struct OCMCountry : JSONJoy {
    var ID:Int
    var Title:String?
    var ISOCode:String?
    
    init() {
        ID=0
    }
    init(_ decoder: JSONDecoder) {
        ID = decoder["ID"].integer!
        Title = decoder["Title"].string!
        ISOCode = decoder["ISOCode"].string!
        
    }
}
struct OCMChargePoint : JSONJoy {
    var ID: Int
    
    var UUID: String?
    
    var ParentChargePointID :Int?
    
    var DataProviderID: Int?
    
    var DataProvider = OCMDataProvider()
    var DataProvidersReference: String?
    
    var OperatorID : Int?
    
    var OperatorInfo = OCMOperatorInfo()
    
    var AddressInfo = OCMAddressInfo()
    /*
    [DisplayName("Operators Own Ref")]
    [StringLength(100)]
    public string OperatorsReference { get; set; }
    
    public int? UsageTypeID { get; set; }
    
    [DisplayName("Usage Type")]
    public UsageType UsageType { get; set; }
    
    [DisplayName("Usage Cost")]
    [StringLength(200)]
    public string UsageCost { get; set; }
    
    [DisplayName("Nearest Address")]
    public AddressInfo AddressInfo { get; set; }
    
    [DisplayName("Number Of Stations/Bays")]
    [Range(0, 100)]
    public int? NumberOfPoints { get; set; }
    
    [DisplayName("General Comments"), DataType(System.ComponentModel.DataAnnotations.DataType.MultilineText)]
    public string GeneralComments { get; set; }
    
    [DisplayName("Date Planned")]
    public DateTime? DatePlanned { get; set; }
    
    [DisplayName("Date Last Confirmed")]
    public DateTime? DateLastConfirmed { get; set; }
    
    public int? StatusTypeID { get; set; }
    
    [DisplayName("Operational Status")]
    public StatusType StatusType { get; set; }
    
    [DisplayName("Date Status Last Updated")]
    public DateTime? DateLastStatusUpdate { get; set; }
    
    [DisplayName("Data Quality Level")]
    [Range(1, 5)]
    public int? DataQualityLevel { get; set; }
    
    [DisplayName("Data Added")]
    public DateTime? DateCreated { get; set; }
    
    public int? SubmissionStatusTypeID { get; set; }
    
    [DisplayName("Submission Status")]
    public SubmissionStatusType SubmissionStatus { get; set; }
    
    [DisplayName("Comments/Checkins")]
    public List<UserComment> UserComments { get; set; }
    
    [DisplayName("% Similarity")]
    public int? PercentageSimilarity { get; set; }
    
    [DisplayName("Equipment Info")]
    public List<ConnectionInfo> Connections { get; set; }
    
    [DisplayName("Media Items")]
    public List<MediaItem> MediaItems { get; set; }
    
    [DisplayName("Metadata")]
    public List<MetadataValue> MetadataValues { get; set; }
    */
    
    init() {
        ID=0
    }
    init(_ decoder: JSONDecoder) {
        ID = decoder["ID"].integer!
        UUID = decoder["UUID"].string!
        OperatorID = decoder["OperatorID"].integer!
        
        AddressInfo = OCMAddressInfo(decoder["AddressInfo"])
    }
    
}

enum OCMDistanceUnit {
    case Miles
    case KM
}

struct OCMAddressInfo : JSONJoy {
    var ID: Int
    var Title :String?
    
    var AddressLine1:String?
    
    
    var  AddressLine2 :String?
    
    var Town:String?
    
    var StateOrProvince :String?
    
    
    var Postcode :String?
    
    var CountryID : Int
    
    var Country: OCMCountry?
    
    var Latitude : Double
    
    var Longitude: Double
    var ContactTelephone1 :String?
    
    var ContactTelephone2 :String?
    
    var ContactEmail :String?
    
    var AccessComments :String?
    
    var RelatedURL:String?
    
    var Distance :Double?
    var DistanceUnit: OCMDistanceUnit?
    
    init (){
        ID=0
        CountryID=0
        Latitude=0
        Longitude=0
    }
    
    init(_ decoder: JSONDecoder) {
        ID = decoder["ID"].integer!
        Title = decoder["Title"].string!
        AddressLine1 = decoder["AddressLine1"].string!
        CountryID = decoder["CountryID"].integer!
        Latitude = decoder["Latitude"].double!
        Longitude = decoder["Longitude"].double!
        
    }
}
