#import "ColeccionViewController.h"
#import "DetalleViewController.h"
#import "TablaViewController.h"

@interface ColeccionViewController ()<TablaDelegate>
@property (strong, nonatomic) UIPopoverController *toolbarPopoverController;

@end

@implementation ColeccionViewController


-(void)cambiarTema:(NSInteger)clave
{
   
    [self initWithClave:clave];
}
-(void)initWithClave:(NSInteger)clave
{
   
        self.modelo500px= [Modelo500px sharedInstance];
    
        
        NSString *tipo=[self.modelo500px.listado objectAtIndex:clave];
        [self.modelo500px consulta500px:tipo completion:^{
           
            [self.collectionView reloadData];
           
        }];
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
   
    [self initWithClave:1];
    
}

#pragma mark UICollectionviewdatasource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   return [self.modelo500px.fotos count];
   // return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CeldaFoto" forIndexPath:indexPath];
    
    _foto500px=[[Foto500px alloc]init];
    
    FotoColeccionCell *celda=(FotoColeccionCell *)cell;
    
   _foto500px=[self.modelo500px.fotos objectAtIndex:indexPath.row];
 
     NSString *fotourl=_foto500px.rutafoto;

    
      
    [self.foto500px cargarFoto:fotourl completion:^(UIImage *image){
   
    	
       celda.fotoImageView.image = image;
  
    }];
  
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if([segue.identifier isEqualToString:@"detalle"]) {
		UICollectionViewCell *celda = sender;
	
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:celda];
        _foto500px=[self.modelo500px.fotos objectAtIndex:indexPath.row];
        NSString *fotourl=_foto500px.rutafoto;

		DetalleViewController *detalle = segue.destinationViewController;
		detalle.fotoruta=fotourl;
        
	}
    if([segue.identifier isEqualToString:@"popover"]) {
		        
       
        
		TablaViewController *tabla = segue.destinationViewController;
        tabla.delegate=self;
        if([self.toolbarPopoverController isPopoverVisible]){
            [self.toolbarPopoverController dismissPopoverAnimated:NO];
        }

        
        
	}
}
-(void)viewWillDisappear:(BOOL)animated
{
    if([self.toolbarPopoverController isPopoverVisible]){
        [self.toolbarPopoverController dismissPopoverAnimated:NO];
    }
}

@end
