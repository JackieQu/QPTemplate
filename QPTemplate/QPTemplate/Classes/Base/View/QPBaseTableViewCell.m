//
//  QPBaseTableViewCell.m
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import "QPBaseTableViewCell.h"

@implementation QPBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

@end
