#import "Foto500px.h"

@implementation Foto500px



-(void)cargarFoto:(NSString *)fotourl completion:(cargarFotoCompletion)completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^{
                       _modelo500px=[[Modelo500px alloc]init];
                       UIImage *image;
                       NSArray *components = [fotourl pathComponents];
                                             
                       NSString *fotoPathComponent = [NSString stringWithFormat:@"%@_%@_%@_3.jpg", components[1], components[2], components[3]];

                       NSFileManager *fileManager = [NSFileManager defaultManager];
                       
                       NSString *cacheMiniPath = [self.modelo500px.cacheMini path];
                       
                       NSString *fot = [cacheMiniPath stringByAppendingPathComponent:fotoPathComponent];
                       
                       if ([fileManager fileExistsAtPath:fot]){
                                                    image = [UIImage imageWithContentsOfFile:fot];
                       }
                       
                       else{
                           
                           
                       NSData *fotodata = [NSData dataWithContentsOfURL:[NSURL URLWithString:fotourl]];
                  
                        image = [UIImage imageWithData:fotodata];
                           
                        NSString *cacheMiniPath = [self.modelo500px.cacheMini path];
                           
                        NSString *fotoPath = [cacheMiniPath stringByAppendingPathComponent:fotoPathComponent];
      
                           
                        [fotodata writeToURL:[NSURL fileURLWithPath:fotoPath] atomically:YES];
                      
                       }
                  
                       
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^{
                                          
                                          completion(image);
                                      }
                                      );
                   }
                   );
    
    
}



-(void)cargarFotoGrande:(NSString *)fotourl completion:(cargarFotoGrandeCompletion)completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^{
                       _modelo500px=[[Modelo500px alloc]init];
                       UIImage *image;
                       NSArray *components = [fotourl pathComponents];
                       
                       NSString *fotoPathComponent = [NSString stringWithFormat:@"%@_%@_%@_4.jpg", components[1], components[2], components[3]];
                       
                       NSFileManager *fileManager = [NSFileManager defaultManager];
                       
                       NSString *cacheMiniPath = [self.modelo500px.cacheMini path];
                       
                       NSString *fot = [cacheMiniPath stringByAppendingPathComponent:fotoPathComponent];
                       
                       if ([fileManager fileExistsAtPath:fot]){
                            image = [UIImage imageWithContentsOfFile:fot];
                       }
                       
                       else{
                           
                           NSArray *componentsGrande = [fotourl pathComponents];
                           
                           
                           NSString *fotoGrande = [NSString stringWithFormat:@"http://%@/%@/%@/4.jpg", componentsGrande[1], componentsGrande[2], componentsGrande[3]];
                           
                         
                           NSData *fotodataGrande = [NSData dataWithContentsOfURL:[NSURL URLWithString:fotoGrande]];
                           
                          
                           image = [UIImage imageWithData:fotodataGrande];
                           
                           NSString *fotoPathComponent2 = [NSString stringWithFormat:@"%@_%@_%@_4.jpg", components[1], components[2], components[3]];
                           NSString *cacheMiniPath = [self.modelo500px.cacheMini path];
                           
                       
                           
                           NSString *fotoPath2 = [cacheMiniPath stringByAppendingPathComponent:fotoPathComponent2];
                           
                         
                           [fotodataGrande writeToURL:[NSURL fileURLWithPath:fotoPath2] atomically:YES];
                           
                       }
                       
                       
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^{
                                            completion(image);
                                      }
                                      );
                   }
                   );
    
    
}



@end
