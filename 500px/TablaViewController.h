#import <UIKit/UIKit.h>
#import "Modelo500px.h"

@protocol TablaDelegate <NSObject>

-(void)cambiarTema:(NSInteger)clave;

@end

@interface TablaViewController : UITableViewController

@property (strong,nonatomic) Modelo500px *modelo500px;

@property (strong,nonatomic) id<TablaDelegate> delegate;

@end
