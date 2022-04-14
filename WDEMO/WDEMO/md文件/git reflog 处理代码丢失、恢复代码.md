#git reflog 处理代码丢失、恢复代码
https://www.cnblogs.com/greensunit/p/14953435.html



git reflog 处理代码丢失、恢复代码

reflog 是 Git 操作的一道安全保障，它能够记录几乎所有本地仓库的改变。包括所有分支 commit 提交，已经删除（其实并未被实际删除）commit 都会被记录。总结而言，只要 HEAD 发生变化，就可以通过 reflog 查看到。

背景：将分支本地代码提交到master过程中导致本地代码丢失，在提交记录里找不到，远程分支也没有。

1、执行 git reflog 查看操作日志

dd6e43d (HEAD -> master, origin/master, origin/HEAD) HEAD@{0}: pull: Fast-forward
b6786f4 HEAD@{1}: reset: moving to b6786f4af248e0a84351ff6d60d9cd70013e5f16
af24a0b HEAD@{2}: reset: moving to HEAD
af24a0b HEAD@{3}: reset: moving to HEAD
af24a0b HEAD@{4}: reset: moving to HEAD
af24a0b HEAD@{5}: reset: moving to HEAD
af24a0b HEAD@{6}: reset: moving to HEAD
af24a0b HEAD@{7}: commit: add:每周督查表
b6786f4 HEAD@{8}: pull: Fast-forward
5e7ba6a HEAD@{9}: commit: add:每周小组工作汇报模板
39b8d49 HEAD@{10}: pull: Fast-forward
0ccf86d HEAD@{11}: pull: Fast-forward
8c8926a HEAD@{12}: pull: Fast-forward
8f0a825 HEAD@{13}: pull: Fast-forward
699f161 HEAD@{14}: commit: add:科室制度
07c7a3c HEAD@{15}: pull: Fast-forward

2、查看对应的版本号,就可以恢复到任意版本:

git reset --hard "af24a0b"

3、找回丢失文件



------------------------------------------------------------------------------
Git Git Rebase后，本地代码丢失解决方法
https://www.codercto.com/topics/1286.html

问题描述：

提交代码时，因为文件太大，多次push失败，然后打算回退，rebase了两次，本地代码丢失了，吓得我差点跳起来。

lcc@lcc MyDoc$  git reset --hard 9c15d6f85a9bcb68899278dbaab5ac3a449390ea
lcc@lcc MyDoc$ git push origin HEAD --force

解决方法如下：

1、执行命令：

lcc@lcc MyDoc$ git reflog
9c15d6f (HEAD -> master, origin/master, origin/HEAD) HEAD@{0}: reset: moving to 9c15d6f85a9bcb68899278dbaab5ac3a449390ea
0bd8c12 HEAD@{1}: reset: moving to 0bd8c12c3b44c5d16ff6e9ce84d00230561b7f12
fcae336 HEAD@{2}: commit: drui io
0bd8c12 HEAD@{3}: reset: moving to 0bd8c12c3b44c5d16ff6e9ce84d00230561b7f12
0a69e82 HEAD@{4}: commit: 第二次提交，大文件失败
de978a9 HEAD@{5}: reset: moving to HEAD
de978a9 HEAD@{6}: reset: moving to de978a99704e1bec6d2e81fcfd24900e6be43d8e
f96a7d2 HEAD@{7}: reset: moving to f96a7d270c8d6a253530309a9f485a8d2a84befe
f96a7d2 HEAD@{8}: commit: 第一次提交
de978a9 HEAD@{9}: reset: moving to de978a99704e1bec6d2e81fcfd24900e6be43d8e
de978a9 HEAD@{10}: reset: moving to de978a99704e1bec6d2e81fcfd24900e6be43d8e

2、用reset (Suppose the old commit was HEAD@{5} in the ref log)

git reset --hard HEAD@{8}

亲测有效！解决了～解决了～

