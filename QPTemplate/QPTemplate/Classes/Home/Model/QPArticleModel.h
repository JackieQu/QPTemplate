//
//  QPArticleModel.h
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import "QPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QPArticleModel : QPBaseModel

@property (nonatomic, strong) NSString *headURL;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageURL;

@end

NS_ASSUME_NONNULL_END
