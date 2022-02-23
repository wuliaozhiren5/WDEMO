//
//  RRDramaCommentCell.m
//  NJVideo
//
//  Created by WDEMO on 2021/8/2.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRDramaCommentCell.h"
#import "RRMJTool.h"
//#import "RRAlertBase.h"
//#import "RRAlertView.h"
//#import "ReportApi.h"
//#import "RRThumbUpApi.h"
//#import "RRDramaCommentDeletetApi.h"

@implementation RRDramaCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
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
    self.tableView.userInteractionEnabled = NO;
    self.photoCollectionView.userInteractionEnabled = NO;
    //评分scoreView
    [self.contentView addSubview:self.scoreView];
}

- (void)setModel:(RRSeniorCommentsModel *)model {
    [super setModel:model];
    //填充数据
    self.scoreView.score = model.score;
    self.dateLab.text = [RRMJTool getFormatterDateStringWithTimeInterval:model.updateTime / 1000.0];
}

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model isShowAll:(BOOL)isShowAll {
   
    CGFloat currentHeight = [super cellHeightWithModel:model isShowAll:isShowAll];
    return currentHeight;
}

////查看全文
- (void)clickFullTextBtn {
    if (self.clickAllCell) {
        self.clickAllCell(self.model);
    }
}

////收起
//- (void)clickCutTextBtn {
//}

#pragma mark - 长按手势
- (void)longPressToDo:(UILongPressGestureRecognizer *)gesture {
 
}

#pragma mark -  RRSeasonSeniorCommentsReplyTableViewDelegate
- (void)seasonSeniorCommentsReplyTableView:(UITableView *)tableView
                   didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (self.clickAllCell) {
//        self.clickAllCell(self.model);
//    }
}

#pragma mark - 点赞
- (void)clickPraiseBtn:(UIButton *)btn {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            NSString *typeId = self.model.ID;
//            BOOL liked = self.model.liked;
//            @strongify(self);
//            [RRThumbUpApi postThumUp:liked
//                            targetId:typeId
//                                type:RRThumbUpTypeDramaComment block:^(RRJsonModel * _Nonnull result, NSError * _Nonnull error) {
//                @strongify(self);
//                if (!result) {
//                    TOAST(error.localizedDescription);
//                    return;
//                } else {
//                    if (!liked) {
//                        TOAST(@"点赞成功");
//                        self.model.liked = YES;
//                        self.model.likeCount = self.model.likeCount + 1;
//                        self.praiseBtn.selected = YES;
//                        self.praiseBtnLab.text = [NSString transformCountWithString:self.model.likeCount];
//                    } else {
//                        TOAST(@"取消点赞");
//                        self.model.liked = NO;
//                        self.model.likeCount = self.model.likeCount - 1;
//                        self.praiseBtn.selected = NO;
//                        self.praiseBtnLab.text = [NSString transformCountWithString:self.model.likeCount];
//                    }
//                }
//            }];
//        }
//    }];
}

#pragma mark - 举报
- (void)clickReportBtn {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            __block NSString * Message;
//            //408之后 都为commetType   兼容帖子为reply状态
//            ReportApi * api = [[ReportApi alloc] initWithID:self.model.ID type:KDramaCommentType content:nil];
//            [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
//                NSDictionary * dic = request.responseJSONObject;
//                if (dic) {
//                    RRJsonModel * json = [RRJsonModel modelWithDictionary:dic];
//                    if (json.code == SUCCESSCODE) {
//                        Message = @"举报成功";
//        //                    [IanAlert alertSuccess:Message];
//                        TOAST(Message);
//                    }else if (json.code == 1124){
//                        Message = @"该内容您已举报过了";
//        //                    [IanAlert alertSuccess:Message];
//                        TOAST(Message);
//                    }else if (json.code == 1125){
//                        Message = @"您不能举报自己哦";
//        //                    [IanAlert alertError:Message];
//                        TOAST(Message);
//                    }else{
//                        Message = @"举报失败";
//        //                    [IanAlert alertError:Message];
//                        TOAST(Message);
//                    }
//                }else{
//                    Message = @"举报失败";
//        //                [IanAlert alertError:Message];
//                    TOAST(Message);
//                }
//            } failure:^(YTKBaseRequest *request) {
//                Message = @"举报失败";
//        //            [IanAlert alertError:Message];
//                TOAST(Message);
//            }];
//        }
//    }];
}
 
#pragma mark - 删除影评
#pragma mark - 删除btn
- (void)clickDeleteBtn {
//    WS(weakSelf)
//    RRAlertView *alertView = [[RRAlertView alloc] initWithTitle:nil
//                                                        content:@"删除后不可恢复，是否确认删除？"
//                                                    cancelTitle:@"取消"
//                                                      sureTitle:@"确认删除"];
//    alertView.dismissBlock = ^(BOOL isClicked) {
//        if (isClicked) {
//            //确认删除
//            [weakSelf clickSureDeleteBtn];
//        } else {
//            //取消
//        }
//    };
//    [alertView showInView:kAppDelegate.window];
}

#pragma mark - 确认删除btn
- (void)clickSureDeleteBtn {
//    NSString  *typeId = self.model.ID;
//    WS(weakSelf)
//    [RRDramaCommentDeletetApi requestDramaCommentDeleteWithTypeId:typeId block:^(BOOL success, NSError * _Nonnull error) {
//        if (success) {
//            if (weakSelf.clickDelete) {
//                weakSelf.clickDelete(self.model);
//            }
//        }
//    }];
}

#pragma - mark lazy
- (RRDramaCommentScoreView *)scoreView {
    if (!_scoreView) {
        _scoreView = [[RRDramaCommentScoreView alloc] initWithFrame:CGRectMake(61, 66, 200, 12)]; 
    }
    return _scoreView;
}

#pragma mark - 布局
+ (CGFloat)getAvatarImageViewTop {
    return 20;
}

+ (CGFloat)getNicknameLabTop {
    return 31;
}

+ (CGFloat)getContentLabTop {
    return 88;
}

+ (CGFloat)getSpacing {
    return 10;
}

+ (CGFloat)getBottomViewHeight {
    return 36;
}

+ (CGFloat)padding {
    return 16;
}

+ (CGFloat)textLeading {
    return 61;
}

//+ (CGFloat)getScoreViewTop {
//    return 66;
//    return 66;
//}

@end
