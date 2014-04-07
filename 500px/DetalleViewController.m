#import "DetalleViewController.h"

@interface DetalleViewController ()

@end

@implementation DetalleViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
      _foto500px=[[Foto500px alloc]init];
   [self.foto500px cargarFotoGrande:self.fotoruta completion:^(UIImage *image){
	
        self.detalle.image=image;
        
    }];
    

}



@end
