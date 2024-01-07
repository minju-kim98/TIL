import Header from "components/Header";
import Footer from "components/Footer";
import Profile from "components/Profile";
import PostList from "components/PostList";

export default function ProfilePage() {
  return (
    <>
      <Header />
      <Profile />
      <PostList hasNavigation={false}/>
      <Footer />
    </>
  );
}
