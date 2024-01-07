import Header from "components/Header";
import Footer from "components/Footer";
import PostList from "components/PostList";

export default function PostPage() {
  return (
    <>
      <Header />
      <PostList hasNavigation={false} />
      <Footer />
    </>
  );
}
