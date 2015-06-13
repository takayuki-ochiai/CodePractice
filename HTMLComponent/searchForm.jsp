        <div class="search-form">
            <p class="u-fs--24 u-ml--10"><i class="glyphicon glyphicon-search"></i>  書籍を絞り込む</p>
            <form action = "<%=request.getContextPath() %>/books/index" method="get">
                <div class="u-mb--10">
                    <span class="inline-block width-75">書籍名</span><input type="text" name="bookNameMain" placeholder="（例）七つの習慣"/>
                </div>
                <div class="u-mb--10">
                    <span class="inline-block width-75">著者名</span><input type="text" name="author" placeholder="（例）芥川龍之介"/>
                </div>
                <div class="u-mb--20">
                    <span class="inline-block width-75">カテゴリ名</span><input type="text" name="categoryName" placeholder="（例）小説"/>
                </div>
                <div class="u-mb--40">
                    <select name="sortBy">
                        <option value="issueDayDESC">刊行日が新しい順</option>
                        <option value="issueDayASC">刊行日が古い順</option>
                        <option value="reviewPointDESC">評価が高い順</option>
                        <option value="reviewPointASC">評価が低い順</option>
                    </select>
                </div>
                <div class="u-mb--30">
                    <input  class="inline-block u-ml--60 btn btn-warning" type="submit" value="検索する">
                </div>
            </form>
        </div>