//
//  ViewController.m
//  CityAssessment
//
//  Created by Mary Jenel Myers on 1/16/15.
//  Copyright (c) 2015 Mary Jenel Myers. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, CityWebDelegate,DetailViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property NSMutableArray *citiesArray;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property NSIndexPath *cellIndexPath;
@property (weak, nonatomic) IBOutlet UITextField *countryTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    City *baliIndonesia = [[City alloc]initWithFullNameCity:@"Bali" countryName:@"Indonesia" cityImage:[UIImage imageNamed:@"BaliIndonesia"] cityWeb:@"http://en.wikipedia.org/wiki/Bali"];
    City *boraBoraTahiti = [[City alloc]initWithFullNameCity:@"Bora Bora" countryName:@"Tahiti" cityImage:[UIImage imageNamed:@"BoraBoraTahiti"]
                            cityWeb:@"http://en.wikipedia.org/wiki/Bora_Bora"];
    City *phuketThailand = [[City alloc]initWithFullNameCity:@"Phuket" countryName:@"Thailand" cityImage:[UIImage imageNamed:@"PhuketThailand"] cityWeb:@"http://en.wikipedia.org/wiki/Phuket"];
    City *honoluluHawaii = [[City alloc]initWithFullNameCity:@"Honolulu (Hawaii)" countryName:@"USA" cityImage:[UIImage imageNamed:@"HonoluluHawaii"] cityWeb:@"http://en.wikipedia.org/wiki/Bora_Bora"];
    self.citiesArray = [NSMutableArray arrayWithObjects:baliIndonesia, boraBoraTahiti, phuketThailand, honoluluHawaii, nil];
    self.cityTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.cellIndexPath =[NSIndexPath new];


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.citiesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CitiesCell"];
    City *currentCity = [self.citiesArray objectAtIndex:indexPath.row];
    cell.textLabel.text = currentCity.cityName;
    cell.detailTextLabel.text = currentCity.countryName;
    cell.imageView.image = currentCity.cityImage;
    return cell;
}



- (IBAction)onEditButtonPressed:(UIButton *)sender
{
    if ([sender.titleLabel.text isEqual:@"Edit"])
    {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        self.myTableView.editing = true;
    }
    else{
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.myTableView.editing = false;
    }

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath

{
    [self.citiesArray removeObjectAtIndex:self.myTableView.indexPathForSelectedRow.row]; //deleting the object from listArray Strings
    [self.myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject: indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    self.cellIndexPath = indexPath;
    [self.myTableView reloadData];

}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSString *item = [self.citiesArray objectAtIndex:sourceIndexPath.row];
    [self.citiesArray removeObject:item];
    [self.citiesArray insertObject:item atIndex:destinationIndexPath.row];
    [self.myTableView reloadData];

}
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *vc = segue.destinationViewController;
    City *currentCity = [self.citiesArray objectAtIndex:[self.myTableView indexPathForCell:sender].row];
  //  vc.title = currentCity.cityName;
    vc.city = currentCity;
  //  vc.cityImage = currentCity.cityImage;
  //  vc.cityWeb = currentCity.cityWeb;
    vc.delegate = self;
}

-(void)changeCity:(NSString *)newCityName
{
    self.navigationItem.title = newCityName;
}

- (IBAction)onAddButtonPressed:(UIButton *)sender
{
    City *city = [[City alloc]init];
    city.cityName = self.cityTextField.text;
    city.countryName = self.countryTextField.text;
    [self.citiesArray addObject:city];
    [self.myTableView reloadData];
    [self.view endEditing:YES];
    self.cityTextField.text = @"";
    self.countryTextField.text =@"";

}

-(void)viewDidAppear:(BOOL)animated
{
    [self.myTableView reloadData];
}

@end









