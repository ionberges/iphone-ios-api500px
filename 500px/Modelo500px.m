#import "Modelo500px.h"
#import "Foto500px.h"

@implementation Modelo500px



+ (Modelo500px *)sharedInstance
{
    static Modelo500px *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Modelo500px alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self crearDirectorio];
        _listado = @[
        @"popular",
        @"editors"
        ];
        
       }
    return self;
}

-(void)crearDirectorio
{
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    NSURL *cache = [NSURL fileURLWithPath:cachePath];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    _cacheMini = [cache URLByAppendingPathComponent:@"mini" isDirectory:YES];
    if(![fileManager fileExistsAtPath:[_cacheMini path]]) {
        NSError *error;
        [fileManager createDirectoryAtURL:_cacheMini withIntermediateDirectories:YES attributes:nil error:&error];
        if(error) NSLog(@"%@", error);
    }
}



-(void)consulta500px:(NSString *)feature completion:(consulta500pxCompletion)completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^{
                       
                       self.fotos=[[NSMutableArray alloc]init];
                     
                   NSString *urlapi=@"https://api.500px.com/v1/photos?feature=%@&sort=created_at&image_size=3&include_store=store_download&include_states=voted&consumer_key=HERE YOUR 500px APIKEY";
                       
                       
                       NSString *url= [NSString stringWithFormat:urlapi,feature];
                       
                       
                       NSURL *nsurl=[NSURL URLWithString:url];
                       
                       NSData *datos=[NSData dataWithContentsOfURL:nsurl];
                       
                       NSError *error=nil;
                       NSDictionary *resultado=[NSJSONSerialization JSONObjectWithData:datos options:NSJSONReadingMutableContainers error:&error];
                      
                       for (NSArray *c in [resultado valueForKey:@"photos"]) {
                            NSString *nuevo=[c valueForKey:@"image_url"];
                            Foto500px *fotounica=[[Foto500px alloc]init];
                           fotounica.rutafoto=nuevo;
                       
                          [_fotos addObject:fotounica];
                        
                                               
                       }
                       
                       if(error) NSLog(@"error: %@", error);
                         

                   dispatch_async(dispatch_get_main_queue(),
                    ^{
                    
                        completion();
                                      }
                                      );
                   }
                   );
}


@end
