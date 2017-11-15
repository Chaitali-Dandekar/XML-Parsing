//
//  ViewController.m
//  cdXMLparsing
//
//  Created by Student-003 on 10/11/17.
//  Copyright © 2017 chaitali. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str=@"http://www.w3schools.com/xml/plant_catalog.xml";
    NSURL *url=[NSURL URLWithString:str];
    self.plantArray=[[NSMutableArray alloc]init];
    self.priceArray=[[NSMutableArray alloc]init];
    self.saxparserKind=[[NSXMLParser alloc]initWithContentsOfURL:url];
    self.saxparserKind.delegate=self;
    [self.saxparserKind parse];
   
            NSLog(@"The COMMON name is:%@ and price is %@",self.plantArray,self.priceArray);
    
        

    }
   
    
    // Do any additional setup after loading the view, typically from a nib.

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    self.charString=[[NSMutableString alloc]init];
    
    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [self.charString appendString:string];
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
//    NSString *str1,*str2;
//    str1=@"COMMON";
//    str2=@"PRICE";
   if ([elementName isEqualToString:@"COMMON"])
    {
        [self.plantArray addObject:_charString];
      
    }
   
    else if ([elementName isEqualToString:@"PRICE"])
    {
        [self.priceArray addObject:_charString];
        
    }
      }
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _plantArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    cell.textLabel.text=[_plantArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[_priceArray objectAtIndex:indexPath.row];
    UIImageView *img=[UIImage imageNamed:@"2"];
    cell.imageView.image=img;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return _studentarray.count;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];//for creating the custom cell..
//    
//    // Configure the cell...
//    
//    student *temp = [_studentarray objectAtIndex:indexPath.row];
//    cell.rolllbl.text= [NSString stringWithFormat:@"%d",temp.rollno];
//    cell.namelbl.text=temp.name;
//    cell.addlbl.text=temp.add;
//    cell.iview.image=[UIImage imageNamed:temp.iview];
//    return cell;
//    
//    
//    
//    
//    
//}


@end
