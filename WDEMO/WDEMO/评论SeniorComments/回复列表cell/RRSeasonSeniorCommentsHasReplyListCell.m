//
//  RRSeasonSeniorCommentsHasReplyListCell.m
//  PUClient
//
//  Created by rrtv on 2021/4/12.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsHasReplyListCell.h"
#import "RRSeasonSeniorCommentsReplyTableView.h"

@interface RRSeasonSeniorCommentsHasReplyListCell ()
@property (nonatomic, strong) RRSeasonSeniorCommentsReplyTableView *tableView;
@end

@implementation RRSeasonSeniorCommentsHasReplyListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //cell选中颜色
        //        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.isShowMore = NO;
        [self setupViews];
    } else {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setupViews {
    [super setupViews];
    //replyTable
    [self.contentView addSubview:self.tableView];
     
    CGFloat currentHeight = self.singleImageView.frame.origin.y + self.singleImageView.frame.size.height;
 
    //有回复
    BOOL isHasReply = YES;
    self.tableView.frame = CGRectMake(61, 8 + currentHeight,  (KWidth - 61 - 16), 300);
    self.tableView.scrollEnabled = NO;
}

- (RRSeasonSeniorCommentsReplyTableView *)tableView {
    if (!_tableView) {
        _tableView = [[RRSeasonSeniorCommentsReplyTableView alloc] initWithFrame:CGRectMake(61, 200, (KWidth - 61 - 16), 100)];
        _tableView.scrollEnabled = NO;
    }
    return _tableView;
}
@end
