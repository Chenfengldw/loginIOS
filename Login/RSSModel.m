//
//  RSSModel.m
//  BLEoffline
//
//  Created by whathexd on 15/10/7.
//  Copyright (c) 2015年 whathexd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSModel.h"
#import "offline.h"
#import <math.h>

@interface RSSModel()
//@property (strong, nonatomic) NSMutableArray *APposX;
//@property (strong, nonatomic) NSMutableArray *APposY;
//@property (nonatomic) NSInteger numOfAP;
//@property (strong, nonatomic) NSNumber* UserX;
//@property (strong, nonatomic) NSNumber* UserY;
//@property (strong, nonatomic) NSMutableArray *standardRSS;
//@property (strong, nonatomic) NSMutableArray *distance;
//@property (strong, nonatomic) NSMutableArray *RSS_receive;
//@property (strong, nonatomic) NSMutableArray *RSS_distance;

@end

@implementation RSSModel

//-(NSMutableArray *)APposX {
//    if (!_APposX)
//        
//        _APposX = [[NSMutableArray alloc] init];
//    return _APposX;
//    
//}
//
//-(NSMutableArray *)APposY {
//    if (!_APposY)
//        
//        _APposY = [[NSMutableArray alloc] init];
//    return _APposY;
//    
//}
//
//-(NSMutableArray *)standardRSS {
//    if (!_standardRSS)
//        
//        _standardRSS = [[NSMutableArray alloc] init];
//    return _standardRSS;
//    
//}
//
//-(NSMutableArray *)distance {
//    if (!_distance)
//        
//        _distance = [[NSMutableArray alloc] init];
//    return _distance;

//}

//-(NSMutableArray *)RSS_receive {
//    if (!_RSS_receive)
//        
//        _RSS_receive = [[NSMutableArray alloc] init];
//    return _RSS_receive;
//    
//}



-(void) rssInput:(NSMutableArray *)RSSreceive
{
      NSInteger i;
//    double X;
//    double Y;
//    double currentDistance;
//    self.numOfAP= num;
    
    
//    for (i=0;i<self.numOfAP;i++)
//    {   self.APposX[i]=APx[i];
//        self.APposY[i]=APy[i];
//        X= [self.APposX[i] floatValue]-[posX floatValue];
//        Y= [self.APposY[i] floatValue]-[posY floatValue];
//        currentDistance =sqrt(X*X+Y*Y);
//        float distancenum=[self.distance[i] floatValue];
//        float standardRSSnum=[self.standardRSS[i] floatValue];
//        distancenum=currentDistance;
//        standardRSSnum=-(double)60 -(double)20 *log(currentDistance/log((double)10));
//        
//        self.distance[i]=[NSNumber numberWithFloat:distancenum];
//        self.standardRSS[i]=[NSNumber numberWithFloat:standardRSSnum];
//        
//    }
    NSMutableArray *RSSdistance=[[NSMutableArray alloc]init];

    for(i=0;i<[RSSreceive count];i++)
    {   float rssreceivenum=[RSSreceive[i] floatValue];
        //float rssdistancenum=[RSSdistance[i] floatValue];
        //float standardRSSnum=[self.standardRSS[i] floatValue];
        
        
        //double u1 = (double)arc4random() / UINT32_MAX; // uniform distribution
        //double u2 = (double)arc4random() / UINT32_MAX; // uniform distribution
        //double f1 = sqrt(-2 * log(u1));
        //double f2 = 2 * M_PI * u2;
        //double g1 = f1 * cos(f2); // gaussian distribution
        //double g2 = f1 * sin(f2); // gaussian distribution
        
        //rssreceivenum=standardRSSnum;
        float rssdistancenum;
        rssdistancenum=pow(10,((rssreceivenum+(double)80)/(-(double)20)));//core用接收到的rss算距离distance
   
        //RSSreceive[i]=[NSNumber numberWithFloat:rssreceivenum];
        RSSdistance[i]=[NSNumber numberWithFloat:rssdistancenum];  //传到offline.m中的距离数组
        //self.standardRSS[i]=[NSNumber numberWithFloat:standardRSSnum];
    }
    //NSLog(@"%@","123");
    //NSLog(@"%@",self.distance);
    //NSLog(@"%@",self.standardRSS);
    //NSLog(@"%@",self.RSS_distance);
    OffLine *offline = [[OffLine alloc] init];
    NSMutableArray * a1;
    NSMutableArray * a2;
    a1 = [[NSMutableArray alloc] init];
    a2 = [[NSMutableArray alloc] init];
    
    [a1 addObject:@"0"];
    [a2 addObject:@"0"];
    
    [offline thetarandom:RSSdistance APx:a1 APy:a2 APnum:2];
    NSLog(@"RSSdistance");
    NSLog(@"%@",RSSdistance);




}




@end


