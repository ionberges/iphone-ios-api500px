#import <UIKit/UIKit.h>
#import "Foto500px.h"

@interface DetalleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *detalle;
@property (strong,nonatomic) NSString *fotoruta;

@property (strong,nonatomic) Foto500px *foto500px;
@end
