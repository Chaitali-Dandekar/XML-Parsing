//
//  ViewController.h
//  cdXMLparsing
//
//  Created by Student-003 on 10/11/17.
//  Copyright © 2017 chaitali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSXMLParserDelegate, UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *plantArray,*priceArray;
@property NSMutableString *charString;
@property NSXMLParser *saxparserKind;




@end

