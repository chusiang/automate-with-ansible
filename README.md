# 現代 IT 人一定要知道的 Ansible 自動化組態技巧

[![Markdown](https://img.shields.io/badge/%3C%2F%3E-Markdown-blue.svg)](http://markdown.tw) [![GitBook](https://img.shields.io/badge/GitBook-chusiang%2Fautomate--with--ansible-blue.svg)](https://www.gitbook.com/book/chusiang/automate-with-ansible/) [![License: CC BY-NC-SA 3.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%203.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/3.0/)

Ansible 是個與 Puppet, SaltStack, Chef 並駕齊驅的組態設定 (Infrastructure as Code) 工具，其簡單易用的特性讓人愛不釋手，在 DevOps 界更佔有一席之地。

本次凍仁將帶領大家一探 Ansible 這門技藝，並分享些實戰經驗。相信有了 Ansible 我們都可以提早下班了！ (笑) [^1]

若需勘誤，觀迎大家來信 _automate-with-ansible (at) drx.tw_，(當然您也可以上 GitHub 網站 [^2] 送 Pull Request 或發 issues)，讓此書可以更完美。

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/tw/" target="_blank"><img alt="創用 CC 授權條款" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/3.0/tw/88x31.png" /></a>

《現代 IT 人一定要知道的 Ansible 自動化組態技巧》由[凍仁翔][chusiang]製作，以[創用CC 姓名標示-非商業性-相同方式分享 3.0 台灣 授權條款][cc-by-nc-sa]釋出。

> 註：此份文件主要使用 2016/09/29 釋出的 **Ansible 2.1.2** 進行撰寫，部份語法和配置可能與現今有所出入，還請特別留意。

## 目錄

1. [前言](01.intro.md)
1. [Ansible 是什麼？](02.what-is-the-ansible.md)
1. [怎麼部署 Ansible 環境？](03.how-to-deploy-the-ansible.md)
1. [怎麼用 Vagrant 練習 Ansible？](04.how-to-practive-the-ansible-with-vagrant.md)
1. [怎麼用 Docker 練習 Ansible？](05.how-to-practive-the-ansible-with-docker.md)
1. [怎麼操作 Ansible？](06.how-to-use-the-ansible.md)
1. [怎麼用 Jupyter 操控 Ansible？(localhost)](07.how-to-practive-the-ansible-with-jupyter1.md)
1. [怎麼用 Jupyter 操控 Ansible？(Managed node)](08.how-to-practive-the-ansible-with-jupyter2.md)
1. [怎麼用 Docker Compose 練習 Ansible？](09.how-to-practive-the-ansible-with-docker-compose.md)
1. [Ansible 的開發工具有哪些？](10.which-are-the-ansible-developer-tools.md)
1. [怎麼看 Ansible Modules 文件？](11.how-to-see-the-ansible-module-document.md)
1. [常用的 Ansible Module 有哪些？](12.which-are-the-commonly-used-modules.md)
1. [怎麼使用 setup 取得 Managed node 的 facts？](13.how-to-get-the-managed-node-facts-with-setup.md)
1. [怎麼使用 Ansible 的 Template 系統？](14.how-to-use-the-ansible-template-system.md)
1. [怎麼在 Playbooks 裡使用 Handlers？](15.how-to-use-handlers-in-playbooks.md)
1. [Ansible 如何發送 notification 到 Slack？](16.how-to-send-notification-to-slack-on-ansible.md)
1. [Ansible 如何發送 notification 到 HipChat？](17.how-to-send-notification-to-hipchat-on-ansible.md)
1. [如何在 Playbooks 使用 loops？](18.how-to-use-loops-in-playbooks.md)
1. [如何維護大型的 Playbooks？](19.how-to-maintain-the-complex-playbooks.md)
1. [Roles 是什麼？](20.what-is-the-roles.md)
1. [怎麼使用 Roles？](21.how-to-use-the-roles.md)
1. [怎麼用 Roles 部署 LNMP 網頁應用程式？(上)](22.how-to-setup-lnmp-webapp-with-roles-1.md)
1. [怎麼用 Roles 部署 LNMP 網頁應用程式？(下)](23.how-to-setup-lnmp-webapp-with-roles-2.md)
1. [怎麼用 Roles 部署 TestLink？](24.how-to-setup-testlink-with-roles.md)
1. [怎麼在 Ansible Galaxy 分享 Roles？(上)](25.how_to_share_roles_on_galaxy-1.md)
1. [怎麼在 Ansible Galaxy 分享 Roles？(下)](26.how_to_share_roles_on_galaxy-2.md)
1. [怎麼用 Travis CI 測試 Roles？](27.how-to-test-the-roles-with-travis-ci.md)
1. [怎麼混用 Ansible 建置 Docker image？](28.how-to-build-docker-image-with-ansible.md)
1. [怎麼在 Docker Hub 混用 Ansible 自動建置 Docker image？](29.how-to-build-docker-image-with-ansible-on-docker-hub.md)
1. [怎麼用 Vault 管理敏感資料？](30.how-to-manage-sensitive-data-with-vault.md)
1. [總結](31.end.md)

## 誌謝

首先，最感謝的是我的妻子[儀萍](https://github.com/VioletChen)，除了繪製[本書封面](cover.jpg)，在參賽期間還給予了不少支持和照料，要不是有她的督促和校稿凍仁是完成不了本書的。

謝謝從小在背後默默支持我的雙親陳玉鐘女士和賴松村先生，讓凍仁可以自由的發揮所長，走自己的路。

謝謝我的前主管<u>羅春長 (Shortie)</u> 先生，在 IT 這條漫漫長路上，總是在凍仁遇到難題時指點迷津，並在剛就職時就規劃了往後所需的工作技能，還放手讓凍仁在公司導入 Ansible、Docker 等新技術。

謝謝引領凍仁進入 Ansible 世界的<u>[黃俊宏 (sakanamax)][sakanamax]</u> 和<u>[葉秉哲 (William Yeh)][william_yeh]</u> 前輩，讓凍仁了解到導入組態工具後的世界有多美好。

最後還要謝謝 [Ansible 台灣使用者社群][ansible-tw] (Ansible Taiwan User Group) 和曾幫助過凍仁的各位伙伴，要不是有他們就沒有昔日的凍仁。


[^1]: 此為八屆 iT 鐵人賽 [DevOps 組][devops_team]參選作品之一，報名時間為 2016/11/18 02:02:56，並於 2017/02/20 [獲選 DevOps 組冠軍][winner]，其文章將同步發佈於 [GitBook][gitbook] 和 [iT 邦幫忙][ithelp]，並授權 W3Cschool.cn 轉載至 [Ansible 自动化运维教程](https://www.w3cschool.cn/automate_with_ansible/)。

[^2]: 本書的 GitHub 網址為 [https://github.com/chusiang/automate-with-ansible](https://github.com/chusiang/automate-with-ansible)。

[chusiang]: http://note.drx.tw/
[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/3.0/tw/
[william_yeh]: https://twitter.com/william_yeh
[sakanamax]: https://twitter.com/sakanamax
[ansible-tw]: http://ansible.tw/
[devops_team]: http://ithelp.ithome.com.tw/ironman/signup/list?group=devops
[winner]: http://ithelp.ithome.com.tw/announces/9
[gitbook]: https://www.gitbook.com/book/chusiang/automate-with-ansible/details
[ithelp]: http://ithelp.ithome.com.tw/users/20031776/ironman/1022

