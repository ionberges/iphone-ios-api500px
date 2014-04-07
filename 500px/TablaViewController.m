#import "TablaViewController.h"
#import "ColeccionViewController.h"

@interface TablaViewController ()
@property (strong, nonatomic) UIPopoverController *toolbarPopoverController;

@end

@implementation TablaViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
      
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  _modelo500px=[Modelo500px sharedInstance];
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.modelo500px.listado count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"celda";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
   
    cell.textLabel.text=[self.modelo500px.listado objectAtIndex:indexPath.row];
   
    // Configure the cell...
    
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    [self.delegate cambiarTema:indexPath.row];
    if([self.toolbarPopoverController isPopoverVisible]){
        [self.toolbarPopoverController dismissPopoverAnimated:YES];
    }
    
 
}


@end
