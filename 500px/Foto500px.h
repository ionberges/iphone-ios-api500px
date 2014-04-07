#import <Foundation/Foundation.h>

#import "Modelo500px.h"

@interface Foto500px : NSObject

@property (strong,nonatomic) NSString *rutafoto;
@property (strong,nonatomic) Modelo500px *modelo500px;

typedef void(^cargarFotoCompletion)(UIImage *);

-(void)cargarFoto:(NSString *)fotourl completion:(cargarFotoCompletion)completion;

typedef void(^cargarFotoGrandeCompletion)(UIImage *);

-(void)cargarFotoGrande:(NSString *)fotourl completion:(cargarFotoGrandeCompletion)completion;



@end
