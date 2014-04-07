#import <UIKit/UIKit.h>
#import "Modelo500px.h"
#import "FotoColeccionCell.h"
#import "Foto500px.h"
#import "TablaViewController.h"

@interface ColeccionViewController : UICollectionViewController


@property (strong,nonatomic) Modelo500px *modelo500px;
@property (strong,nonatomic) Foto500px *foto500px;
@property (strong,nonatomic)TablaViewController *tabla;

-(void)initWithClave:(NSInteger)clave;
@end
