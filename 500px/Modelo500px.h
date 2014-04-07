#import <Foundation/Foundation.h>

@interface Modelo500px : NSObject

+ (Modelo500px *)sharedInstance;

@property (strong,nonatomic) NSMutableArray *fotos;


@property (strong,nonatomic) NSURL *cacheMini;
@property (strong,nonatomic) NSArray *listado;

typedef void(^consulta500pxCompletion)(void);

-(void)consulta500px:(NSString *)feature completion:(consulta500pxCompletion)completion;

@end
